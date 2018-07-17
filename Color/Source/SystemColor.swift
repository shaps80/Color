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
        let h = color.model.hue
        let s = color.model.saturation
        let v = color.model.value

        if s == 0 { // Achromatic grey
            self.init(red: v, green: v, blue: v, alpha: color.model.alpha)
            return
        }

        let angle = (h >= 360 ? 0 : h)
        let sector = angle / 60 // Sector
        let i = floor(sector)
        let f = sector - i // Factorial part of h

        let p = v * (1 - s)
        let q = v * (1 - (s * f))
        let t = v * (1 - (s * (1 - f)))

        switch(i) {
        case 0:
            self.init(red: v, green: t, blue: p, alpha: color.model.alpha)
        case 1:
            self.init(red: q, green: v, blue: p, alpha: color.model.alpha)
        case 2:
            self.init(red: p, green: v, blue: t, alpha: color.model.alpha)
        case 3:
            self.init(red: p, green: q, blue: v, alpha: color.model.alpha)
        case 4:
            self.init(red: t, green: p, blue: v, alpha: color.model.alpha)
        default:
            self.init(red: v, green: p, blue: q, alpha: color.model.alpha)
        }
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
        let colorSpace = CGColorSpace(name: CGColorSpace.displayP3)!
        let cgColor = self.cgColor.converted(to: colorSpace, intent: .perceptual, options: nil)

        let red: CGFloat = cgColor?.components?[0] ?? 0
        let green: CGFloat = cgColor?.components?[1] ?? 0
        let blue: CGFloat = cgColor?.components?[2] ?? 0
        let alpha: CGFloat = cgColor?.components?[3] ?? 0

        return Color(RGB(red: red, blue: blue, green: green, alpha: alpha))
    }

    /// Returns an HSV color representation
    public var hsv: Color<HSV> {
        let rgb = self.rgb
        let r = rgb.model.red, g = rgb.model.green, b = rgb.model.blue

        let min = r < g ? (r < b ? r : b) : (g < b ? g : b)
        let max = r > g ? (r > b ? r : b) : (g > b ? g : b)

        let v = max
        let delta = max - min

        guard delta > 0.00001 else { // no saturation
            return Color(HSV(hue: 0, saturation: 0, value: max, alpha: rgb.model.alpha))
        }

        guard max > 0 else { // Undefined, achromatic grey
            return Color(HSV(hue: -1, saturation: 0, value: v, alpha: rgb.model.alpha))
        }

        let s = delta / max

        let hue: (CGFloat, CGFloat) -> CGFloat = { max, delta -> CGFloat in
            if r == max { return (g - b) / delta } // between yellow & magenta
            else if g == max { return 2 + (b - r) / delta } // between cyan & yellow
            else { return 4 + (r - g) / delta } // between magenta & cyan
        }

        let h = hue(max, delta) * 60 // In degrees
        return Color(HSV(hue: (h < 0 ? h + 360 : h), saturation: s, value: v, alpha: rgb.model.alpha))
    }

    /// Returns an HSL color representation
    public var hsl: Color<HSL> {
        let colorSpace = CGColorSpace(name: CGColorSpace.displayP3)!
        let cgColor = self.cgColor.converted(to: colorSpace, intent: .perceptual, options: nil)!
        let color = SystemColor(cgColor: cgColor)

        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var lightness: CGFloat = 0
        var alpha: CGFloat = 0

        color?.getHue(&hue, saturation: &saturation, brightness: &lightness, alpha: &alpha)
        return Color(HSL(hue: hue, saturation: saturation, lightness: lightness, alpha: alpha))
    }

    /// Returns an CMYK color representation
    public var cmyk: Color<CMYK> {
        let colorSpace = CGColorSpace(name: CGColorSpace.genericCMYK)!
        let cgColor = self.cgColor.converted(to: colorSpace, intent: .perceptual, options: nil)!
        let color = SystemColor(cgColor: cgColor)

        var cyan: CGFloat = 0
        var magenta: CGFloat = 0
        var yellow: CGFloat = 0
        var black: CGFloat = 0
        var alpha: CGFloat = 0

        color?.getCyan(&cyan, magenta: &magenta, yellow: &yellow, black: &black, alpha: &alpha)
        return Color(CMYK(cyan: cyan, magenta: magenta, yellow: yellow, black: black, alpha: alpha))
    }

}
