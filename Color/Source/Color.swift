//
//  Color.swift
//  Color
//
//  Created by Shaps Benkau on 10/07/2018.
//  Copyright © 2018 152 Percent Ltd. All rights reserved.
//

#if os(iOS)
import UIKit
public typealias SystemColor = UIColor
#else
import AppKit
public typealias SystemColor = NSColor
#endif

import QuartzCore

public protocol ColorSpace: Codable {
    static var colorSpaceName: ColorSpaceName { get }
}

public struct P3: ColorSpace {
    public static let colorSpaceName: ColorSpaceName = .P3
}

public struct RGB: ColorSpace {
    public static let colorSpaceName: ColorSpaceName = .RGB
}

public struct HSB: ColorSpace {
    public static let colorSpaceName: ColorSpaceName = .RGB
}

public struct CMYK: ColorSpace {
    public static let colorSpaceName: ColorSpaceName = .CMYK
}

public enum ColorRep {
    case rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)
    case hsb(hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat)
    case cmyk(cyan: CGFloat, magenta: CGFloat, yellow: CGFloat, black: CGFloat, alpha: CGFloat)
    case hex(String)
}

public struct Color<Space: ColorSpace> {

    public enum CodingKeys: String, CodingKey {
        case colorSpace
    }

    public static var colorSpace: ColorSpace.Type {
        return Space.self
    }

    public let color: SystemColor

    public init(_ rep: ColorRep) {
        switch rep {
        case let .rgb(red, green, blue, alpha):
            let comps = [red, green, blue, alpha]
            let cgColor = CGColor(colorSpace: CGColorSpace(name: CGColorSpace.displayP3)!, components: comps)!
            color = SystemColor(cgColor: cgColor)
            break
//            let color = SystemColor(displayP3Red: red, green: green, blue: blue, alpha: alpha)
//            var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
//            color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
//            print(red, green, blue, alpha)
        case let .hsb(hue, saturation, brightness, alpha):
            break
//            let color = SystemColor(displayP3Red: red, green: green, blue: blue, alpha: alpha)
//            var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
//            color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
//            print(red, green, blue, alpha)
        case let .cmyk(cyan, magenta, yellow, black, alpha):
            break
        case let .hex(value):
            break
        }

        fatalError()
    }

//    public init(systemColor: SystemColor = .black) {
//        let name = String(systemColor.cgColor.colorSpace?.name ?? "")
//        if name != Space.colorSpaceName.rawValue {
//
//        }
//    }

//    public init<Other>(from other: Color<Other>) {
//
//    }
}

extension Color: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        fatalError()
    }
}

#if os(iOS)
fileprivate extension UIColor {

    func usingColorSpaceName(_ name: ColorSpaceName) -> SystemColor? {
        return CGColorSpace(name: name.rawValue as CFString)
            .flatMap { cgColor.converted(to: $0, intent: .defaultIntent, options: nil) }
            .map { SystemColor(cgColor: $0) }
    }

    convenience init(deviceRed red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        self.init(displayP3Red: red, green: green, blue: blue, alpha: alpha)
    }

    convenience init(deviceHue hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) {
        self.init(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
    }

    convenience init(deviceCyan cyan: CGFloat, magenta: CGFloat, yellow: CGFloat, black: CGFloat, alpha: CGFloat) {
        let red = (1 - cyan) * (1 - black)
        let green = (1 - magenta) * (1 - black)
        let blue = (1 - yellow) * (1 - black)
        self.init(deviceRed: red, green: green, blue: blue, alpha: alpha)
    }

    @discardableResult
    func getCyan(_ cyan: UnsafeMutablePointer<CGFloat>?, magenta: UnsafeMutablePointer<CGFloat>?,
                 yellow: UnsafeMutablePointer<CGFloat>?, black: UnsafeMutablePointer<CGFloat>?,
                 alpha: UnsafeMutablePointer<CGFloat>?) -> Bool {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0

        let result = getRed(&red, green: &green, blue: &blue, alpha: alpha)
        guard result else { return false }

        let b = 1 - max(max(red, green), blue)

        if b == 1 {
            cyan?.pointee = 0
            magenta?.pointee = 0
            yellow?.pointee = 0
            black?.pointee = 1
            return true
        }

        cyan?.pointee =  (1 - red - b) / (1 - b)
        magenta?.pointee =  (1 - green - b) / (1 - b)
        yellow?.pointee =  (1 - blue - b) / (1 - b)

        return result
    }

    var cyanComponent: CGFloat {
        var value: CGFloat = -1
        getCyan(&value, magenta: nil, yellow: nil, black: nil, alpha: nil)
        return value
    }

    var magentaComponent: CGFloat {
        var value: CGFloat = -1
        getHue(&value, saturation: nil, brightness: nil, alpha: nil)
        return value
    }

    var yellowComponent: CGFloat {
        var value: CGFloat = -1
        getHue(&value, saturation: nil, brightness: nil, alpha: nil)
        return value
    }

    var blackComponent: CGFloat {
        var value: CGFloat = -1
        getHue(&value, saturation: nil, brightness: nil, alpha: nil)
        return value
    }

    var hueComponent: CGFloat {
        var value: CGFloat = -1
        getHue(&value, saturation: nil, brightness: nil, alpha: nil)
        return value
    }

    var saturationComponent: CGFloat {
        var value: CGFloat = -1
        getHue(nil, saturation: &value, brightness: nil, alpha: nil)
        return value
    }

    var brightnessComponent: CGFloat {
        var value: CGFloat = -1
        getHue(nil, saturation: nil, brightness: &value, alpha: nil)
        return value
    }

    var redComponent: CGFloat {
        var value: CGFloat = -1
        getRed(&value, green: nil, blue: nil, alpha: nil)
        return value
    }

    var greenComponent: CGFloat {
        var value: CGFloat = -1
        getRed(nil, green: &value, blue: nil, alpha: nil)
        return value
    }

    var blueComponent: CGFloat {
        var value: CGFloat = -1
        getRed(nil, green: nil, blue: &value, alpha: nil)
        return value
    }

    var alphaComponent: CGFloat {
        var value: CGFloat = -1
        getRed(nil, green: nil, blue: nil, alpha: &value)
        return value
    }

}

public struct ColorSpaceName : Hashable, Equatable, RawRepresentable {
    public let rawValue: String
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

fileprivate extension ColorSpaceName {
    static var P3: ColorSpaceName {
        return ColorSpaceName(rawValue: CGColorSpace.displayP3 as String)
    }

    static var RGB: ColorSpaceName {
        return ColorSpaceName(rawValue: CGColorSpace.extendedSRGB as String)
    }

    static var CMYK: ColorSpaceName {
        return ColorSpaceName(rawValue: CGColorSpace.genericCMYK as String)
    }
}

#endif
