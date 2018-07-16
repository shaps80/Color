//
//  AppDelegate.swift
//  Color+iOS
//
//  Created by Shaps Benkau on 11/07/2018.
//  Copyright © 2018 152 Percent Ltd. All rights reserved.
//

import UIKit
//import Color

//protocol ColorRep: Codable {
//    var systemColor: SystemColor { get }
//    init(_ value: String)
//}
//
//struct RGBA: ColorRep, Codable {
//    let red: CGFloat
//    let green: CGFloat
//    let blue: CGFloat
//    let alpha: CGFloat
//
//    var systemColor: SystemColor {
//        return SystemColor(red: red, green: green, blue: blue, alpha: alpha)
//    }
//
//    init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
//        self.red = red
//        self.green = green
//        self.blue = blue
//        self.alpha = alpha
//    }
//
//    init(_ string: String) {
//        let comps = string.components(separatedBy: ",")
//        let values = comps
//            .compactMap { UInt($0.trimmingCharacters(in: .whitespaces)) }
//            .map { CGFloat(bitPattern: $0 / 255) }
//
//        red = values[0]
//        green = values[1]
//        blue = values[2]
//        alpha = values[3]
//    }
//
//    /*
//     todo:
//     - validate number of comps
//     - validate expected ranges
//     - add an encoder/decoder option to deal with 8bit ranges
//     */
//    init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        let string = try container.decode(String.self)
//        self.init(string)
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        let values = [red, green, blue, alpha]
//            .compactMap { UInt(exactly: Float($0 * 255)) }
//            .map { String($0) }
//        let string = values.joined(separator: ",")
//        try container.encode(string)
//    }
//}
//
//struct ARGB: ColorRep, Codable {
//    let alpha: CGFloat
//    let red: CGFloat
//    let green: CGFloat
//    let blue: CGFloat
//
//    var systemColor: SystemColor {
//        return SystemColor(red: red, green: green, blue: blue, alpha: alpha)
//    }
//
//    init(alpha: CGFloat, red: CGFloat, green: CGFloat, blue: CGFloat) {
//        self.alpha = alpha
//        self.red = red
//        self.green = green
//        self.blue = blue
//    }
//
//    init(_ string: String) {
//        let comps = string.components(separatedBy: ",")
//        let values = comps
//            .compactMap { UInt($0.trimmingCharacters(in: .whitespaces)) }
//            .map { CGFloat(bitPattern: $0 / 255) }
//
//        alpha = values[0]
//        red = values[1]
//        green = values[2]
//        blue = values[3]
//    }
//
//    /*
//     todo:
//     - validate number of comps
//     - validate expected ranges
//     - add an encoder/decoder option to deal with 8bit ranges
//    */
//    init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        let string = try container.decode(String.self)
//        self.init(string)
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        let values = [alpha, red, green, blue]
//            .compactMap { UInt(exactly: Float($0 * 255)) }
//            .map { String($0) }
//        let string = values.joined(separator: ",")
//        try container.encode(string)
//    }
//}
//
//struct ColorDescriptor<Rep: ColorRep>: Codable, ExpressibleByStringLiteral {
//    public enum CodingKeys: String, CodingKey {
//        case rep
//    }
//
//    let color: SystemColor
//
//    static var rep: Rep.Type {
//        return Rep.self
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        let descriptor = try container.decode(Rep.self, forKey: .rep)
//        color = descriptor.systemColor
//    }
//
//    func encode(to encoder: Encoder) throws {
//        fatalError()
//    }
//
//    init(_ string: String) {
//        self.color = Rep(string).systemColor
//    }
//
//    init(stringLiteral value: StringLiteralType) {
//        self.init(value)
//    }
//
//    init(_ color: SystemColor) {
//        self.color = color
//    }
//
//    init<Other>(_ other: ColorDescriptor<Other>) where Other: ColorRep {
//        self.init(other.color)
//    }
//}
//
//struct Path: Codable {
//
//    enum CodingKeys: String, CodingKey {
//        case strokeColor
//    }
//
//    var strokeColor: SystemColor
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        strokeColor = try container.decode(ColorDescriptor<ARGB>.self, forKey: .strokeColor).color
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(ColorDescriptor<ARGB>(strokeColor), forKey: .strokeColor)
//        // produces  –  "strokeColor": "255, 128, 103, 100"
//    }
//
//}

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {


//        let argb: ColorDescriptor<ARGB> = "255,250,200,10"
//        let rgba = ColorDescriptor<RGBA>(argb) // "250,200,10,255"
//        let hex = ColorDescriptor<HEX>(rgba) // #FAC80A

        return true
    }

}

