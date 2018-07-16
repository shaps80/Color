//
//  Convertibles.swift
//  Color+macOS
//
//  Created by Shaps Benkau on 16/07/2018.
//  Copyright © 2018 152 Percent Ltd. All rights reserved.
//

import Foundation

/// Defines a type that can be represented by a hex value
public protocol HEXValueConvertible: ExpressibleByStringLiteral {

    /// The hex value as a string
    var hexValue: String { get }

    /// Makes a new instance using the specified hex value as a string
    ///
    /// - Parameter hexValue: The hex value as a string
    init(hexValue: String)

}

extension HEXValueConvertible {
    public init(stringLiteral value: String) {
        self.init(hexValue: value)
    }

    public init(extendedGraphemeClusterLiteral value: String) {
        self.init(hexValue: value)
    }

    public init(unicodeScalarLiteral value: String) {
        self.init(hexValue: value)
    }
}

// Adds HEXValueConvertible support to any color where its model also supports it
extension HEXValueConvertible where Self: ColorProtocol, Self.ModelType: HEXValueConvertible {
    public var hexValue: String {
        return model.hexValue
    }

    /// Makes a new color from a hex value
    ///
    /// - Parameter hexValue: The hex representation of this color
    public init(hexValue: String) {
        self.init(ModelType(hexValue: hexValue))
    }

    /// Makes a new color from a hex string
    ///
    /// - Parameter value: The hex representation of this color
    public init(stringLiteral value: String) {
        self.init(hexValue: value)
    }
}

extension RGBColorModel {
    /// Returns the hex value for an RGB color
    public var hexValue: String { fatalError() }
}

extension HEXValueConvertible where Self == RGB {
    /// Makes an RGB representation of the specified hex value
    ///
    /// - Parameter hexValue: The RGB hex value of this color
    public init(hexValue: String) { fatalError() }
}

extension HEXValueConvertible where Self == HSV {
    /// Makes an HSV representation of the specified hex value
    ///
    /// - Parameter hexValue: The RGB hexValue representation of this color
    public init(hexValue: String) { fatalError() }
}

extension HEXValueConvertible where Self == HSL {
    /// Makes an HSL representation of the specified hex value
    ///
    /// - Parameter hexValue: The RGB hexValue representation of this color
    public init(hexValue: String) { fatalError() }
}

extension HEXValueConvertible where Self == CMYK {
    /// Returns the hex value for a CMYK color
    public var hexValue: String { fatalError() }
    /// Makes an CMYK representation of the specified hex value
    ///
    /// - Parameter hexValue: The CMYK hex value of this color
    public init(hexValue: String) { fatalError() }
}

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
    public var cmyk: CMYKColor {
        fatalError()
    }
}

extension RGBConvertible where ModelType == HSV {
    /// Converts an HSV value into an RGB value
    public var rgb: RGBColor<RGB> {
        fatalError()
    }
    /// Converts an HSL value into an RGB value
    public var hsl: RGBColor<HSL> {
        fatalError()
    }
}

extension RGBConvertible where ModelType == HSL {
    /// Converts an HSL value into an RGB value
    public var rgb: RGBColor<RGB> {
        fatalError()
    }
    /// Converts an HSL value into an HSV value
    public var hsv: RGBColor<HSV> {
        fatalError()
    }
}

extension RGBConvertible where ModelType == RGB {
    /// Converts an RGB value into an HSL value
    public var hsl: RGBColor<HSL> {
        fatalError()
    }
    /// Converts an RGB value into an HSV value
    public var hsv: RGBColor<HSV> {
        fatalError()
    }
}

// RGBColor can be converted between RGB, HSL, HSV and CMYK values
extension RGBColor: RGBConvertible, HSVConvertible, HSLConvertible, CMYKConvertible { }
// RGBColor can be converted using hex values
extension RGBColor: HEXValueConvertible { }
// CMYKColor can be converted using hex values
extension CMYKColor: HEXValueConvertible { }
