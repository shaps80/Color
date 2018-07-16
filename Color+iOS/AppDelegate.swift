//
//  AppDelegate.swift
//  Color+iOS
//
//  Created by Shaps Benkau on 11/07/2018.
//  Copyright © 2018 152 Percent Ltd. All rights reserved.
//

import UIKit
import Color

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let rgb: RGBColor<HSL> = "#fff" // initialize with a RGB-based hex value
        let cmyk = rgb.cmyk // cmyk can't be easily converted back to rgb so its not implemented
        let cmykHex = cmyk.hexValue // would print a CMYK-based hex value

        return true
    }

}

