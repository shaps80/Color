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

extension RGBConvertible where ModelType == HSV {
    /// Converts an HSV value into an RGB value
    public var rgb: Color<RGB> {
        fatalError()
    }
    /// Converts an HSL value into an RGB value
    public var hsl: Color<HSL> {
        fatalError()
    }
}

extension RGBConvertible where ModelType == HSL {
    /// Converts an HSL value into an RGB value
    public var rgb: Color<RGB> {
        fatalError()
    }
    /// Converts an HSL value into an HSV value
    public var hsv: Color<HSV> {
        fatalError()
    }
}

extension RGBConvertible where ModelType == RGB {
    /// Converts an RGB value into an HSL value
    public var hsl: Color<HSL> {
        fatalError()
    }
    /// Converts an RGB value into an HSV value
    public var hsv: Color<HSV> {
        fatalError()
    }
}
