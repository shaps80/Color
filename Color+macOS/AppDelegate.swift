//
//  AppDelegate.swift
//  Color+macOS
//
//  Created by Shaps Benkau on 11/07/2018.
//  Copyright © 2018 152 Percent Ltd. All rights reserved.
//

import Cocoa
import Color

@NSApplicationMain
final class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    func applicationDidFinishLaunching(_ notification: Notification) {
        let p3 = Color<P3>(systemColor: .blue)
        let rgb = Color<RGB>(from: p3)

        let hsb = Color<HSB>(from: rgb)
        let cmyk = Color<CMYK>(from: hsb)
        let loop = Color<RGB>(from: cmyk)
    }

}
