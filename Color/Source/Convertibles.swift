//
//  Convertibles.swift
//  Color+macOS
//
//  Created by Shaps Benkau on 16/07/2018.
//  Copyright © 2018 152 Percent Ltd. All rights reserved.
//

import Foundation

// RGBColor can be converted between RGB, HSL, HSV and CMYK values
extension Color: RGBConvertible, HSVConvertible, HSLConvertible, CMYKConvertible { }

/// Defines a type that can represented by an RGB values
public protocol RGBConvertible {
    associatedtype ModelType: ColorModel
}

/// Defines a type that can represented by an HSV values
public protocol HSVConvertible {
    associatedtype ModelType: ColorModel
}

/// Defines a type that can represented by an HSL values
public protocol HSLConvertible {
    associatedtype ModelType: ColorModel
}

/// Defines a type that can represented by an CMYK values
public protocol CMYKConvertible {
    associatedtype ModelType: ColorModel
}

extension CMYKConvertible where ModelType: RGBColorModel {
    /// Converts an RGB value into a CMYK value
    public var cmyk: Color<CMYK> {
        fatalError()
    }
}

extension RGBConvertible where Self: ColorProtocol, Self.ModelType == ModelType, ModelType == HSV {
    /// Converts an HSV value into an RGB value
    public var rgb: Color<RGB> {
        let h = model.hue
        let s = model.saturation
        let v = model.value

        if s == 0 { // Achromatic grey
            return Color(RGB(red: v, green: v, blue: v, alpha: model.alpha))
        }

        let angle = (h >= 360 ? 0 : h)
        let sector = angle / 60 // Sector
        let i = floor(sector)
        let f = sector - i // Factorial part of h

        let p = v * (1 - s)
        let q = v * (1 - (s * f))
        let t = v * (1 - (s * (1 - f)))

        switch i {
        case 0: return Color(RGB(red: v, green: t, blue: p, alpha: model.alpha))
        case 1: return Color(RGB(red: q, green: v, blue: p, alpha: model.alpha))
        case 2: return Color(RGB(red: p, green: v, blue: t, alpha: model.alpha))
        case 3: return Color(RGB(red: p, green: q, blue: v, alpha: model.alpha))
        case 4: return Color(RGB(red: t, green: p, blue: v, alpha: model.alpha))
        default: return Color(RGB(red: v, green: p, blue: q, alpha: model.alpha))
        }
    }
    /// Converts an HSL value into an RGB value
    public var hsl: Color<HSL> {
        fatalError()
    }
}

extension RGBConvertible where Self: ColorProtocol, Self.ModelType == ModelType, ModelType == HSL {
    /// Converts an HSL value into an RGB value
    public var rgb: Color<RGB> {
        fatalError()
//        let c = b * s
//        let x = c * (1 - abs((h * 6).truncatingRemainder(dividingBy: 2) - 1))
//        let m = b - c
//
//        var r, g, b: CGFloat
//
//        switch h * 6 {
//        case 0..<1: (r, g, b) = (c, x, 0) + m
//        case 1..<2: (r, g, b) = (x, c, 0) + m
//        case 2..<3: (r, g, b) = (0, c, x) + m
//        case 3..<4: (r, g, b) = (0, x, c) + m
//        case 4..<5: (r, g, b) = (x, 0, c) + m
//        case 5..<6: (r, g, b) = (c, 0, x) + m
//        default:    (r, g, b) = (0, 0, 0) + m
//        }
//
//        return (round(r * 255), round(g * 255), round(b * 255))
    }
    /// Converts an HSL value into an HSV value
    public var hsv: Color<HSV> {
        fatalError()
    }
}

extension RGBConvertible where Self: ColorProtocol, Self.ModelType == ModelType, ModelType == RGB {
    /// Converts an RGB value into an HSL value
    public var hsl: Color<HSL> {
        fatalError()
    }
    /// Converts an RGB value into an HSV value
    public var hsv: Color<HSV> {
        fatalError()
    }
}
