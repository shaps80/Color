//
//  ColorModels.swift
//  Color+macOS
//
//  Created by Shaps Benkau on 16/07/2018.
//  Copyright © 2018 152 Percent Ltd. All rights reserved.
//

import Foundation
import CoreGraphics

// MARK: - Abstract Models

/// Defines an abstract color model
public protocol ColorModel { }

/// Defines an RGB based color model
public protocol RGBColorModel: ColorModel, HEXValueConvertible { }

// MARK: - RGB Based Models

/// Defines an RGB color model with RGB components
public struct RGB: RGBColorModel {
    public var red: CGFloat
    public var blue: CGFloat
    public var green: CGFloat
    public var alpha: CGFloat
}

/// Defines an RGB color model with HSV components
public struct HSV: RGBColorModel {
    public var hue: CGFloat
    public var saturation: CGFloat
    public var value: CGFloat
    public var alpha: CGFloat
}

/// Defines an RGB color model with HSL components
public struct HSL: RGBColorModel {
    public var hue: CGFloat
    public var saturation: CGFloat
    public var lightness: CGFloat
    public var alpha: CGFloat
}

// MARK: - CMYK Based Models

/// Defines an CMYK color model with CMYK components
public struct CMYK: ColorModel, HEXValueConvertible {
    public var cyan: CGFloat
    public var magenta: CGFloat
    public var yellow: CGFloat
    public var black: CGFloat
    public var alpha: CGFloat
}
