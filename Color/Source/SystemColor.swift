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
    public convenience init(color: Color<RGB>) {
        self.init(red: color.model.red, green: color.model.green, blue: color.model.blue, alpha: color.model.alpha)
    }

    /// Makes a new system color using an HSL value
    ///
    /// - Parameter color: The HSL color representation
    public convenience init(color: Color<HSL>) {
        self.init(hue: color.model.hue, saturation: color.model.saturation, brightness: color.model.lightness, alpha: color.model.alpha)
    }

    /// Makes a new system color using an HSV value
    ///
    /// - Parameter color: The HSV color representation
    public convenience init(color: Color<HSV>) {
        fatalError()
    }

    /// Makes a new system color using an CMYK value
    ///
    /// - Parameter color: The CMYK color representation
    public convenience init(color: Color<CMYK>) {
        let components = [
            color.model.cyan,
            color.model.magenta,
            color.model.yellow,
            color.model.black,
            color.model.alpha
        ]

        let colorSpace = CGColorSpace(name: CGColorSpace.genericCMYK)!
        let cgColor = CGColor(colorSpace: colorSpace, components: components)!
        self.init(ciColor: CIColor(cgColor: cgColor)) // using CIColor to match behaviour across platforms
    }

}

extension SystemColor {

    /// Returns an RGB color representation
    public var rgb: Color<RGB> {
        fatalError()
    }

    /// Returns an HSV color representation
    public var hsv: Color<HSV> {
        fatalError()
    }

    /// Returns an HSL color representation
    public var hsl: Color<HSL> {
        fatalError()
    }

    /// Returns an CMYK color representation
    public var cmyk: Color<CMYK> {
        fatalError()
    }


}
