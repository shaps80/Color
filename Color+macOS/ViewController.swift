//
//  ViewController.swift
//  Color+macOS
//
//  Created by Shaps Benkau on 17/07/2018.
//  Copyright © 2018 152 Percent Ltd. All rights reserved.
//

import AppKit
import Color

final class Window: NSWindow {

    @IBOutlet private weak var rgbView: NSView!
    @IBOutlet private weak var hslView: NSView!
    @IBOutlet private weak var hsvView: NSView!
    @IBOutlet private weak var cmykView: NSView!

    override func awakeFromNib() {
        super.awakeFromNib()

        [rgbView, hslView, hsvView, cmykView].forEach { $0?.wantsLayer = true }

        let color = NSColor.green

        let rgb = color.rgb
        let hsl = color.hsl
        let hsv = color.hsv
        let cmyk = color.cmyk

        rgbView.layer?.backgroundColor = SystemColor(color: rgb).cgColor
        hslView.layer?.backgroundColor = SystemColor(color: hsl).cgColor
        hsvView.layer?.backgroundColor = SystemColor(color: hsv).cgColor
        cmykView.layer?.backgroundColor = SystemColor(color: cmyk).cgColor
    }

}
