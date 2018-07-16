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
        let rgb: Color<HSL> = "#fff" // initialize with a RGB-based hex value
        let cmyk = rgb.cmyk // cmyk can't be easily converted back to rgb so its not implemented
        let cmykHex = cmyk.hexValue // would print a CMYK-based hex value
    }

}
