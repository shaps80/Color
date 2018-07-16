//
//  SystemColor.swift
//  Color+macOS
//
//  Created by Shaps Benkau on 16/07/2018.
//  Copyright © 2018 152 Percent Ltd. All rights reserved.
//

#if os(OSX)
import AppKit
public typealias SystemColor = NSColor
#else
import UIKit
public typealias SystemColor = UIColor
#endif

extension SystemColor {

    /// Makes a new system color using an RGB value
    ///
    /// - Parameter color: The RGB color representation
    public convenience init(color: RGBColor<RGB>) {
        fatalError()
    }

    /// Makes a new system color using an HSL value
    ///
    /// - Parameter color: The HSL color representation
    public convenience init(color: RGBColor<HSL>) {
        fatalError()
    }

    /// Makes a new system color using an HSV value
    ///
    /// - Parameter color: The HSV color representation
    public convenience init(color: RGBColor<HSV>) {
        fatalError()
    }

    /// Makes a new system color using an CMYK value
    ///
    /// - Parameter color: The CMYK color representation
    public convenience init(color: CMYKColor) {
        fatalError()
    }

}

extension SystemColor {

    /// Returns an RGB color representation
    public var rgb: RGBColor<RGB> {
        fatalError()
    }

    /// Returns an HSV color representation
    public var hsv: RGBColor<HSV> {
        fatalError()
    }

    /// Returns an HSL color representation
    public var hsl: RGBColor<HSL> {
        fatalError()
    }

    /// Returns an CMYK color representation
    public var cmyk: CMYKColor {
        fatalError()
    }

}
