//
//  Hexidecimal.swift
//  Color
//
//  Created by Shaps Benkau on 16/07/2018.
//  Copyright © 2018 152 Percent Ltd. All rights reserved.
//

import Foundation

/// Defines a type that can be represented by a hex value
public protocol ExpressibleAsHexadecimal: ExpressibleByStringLiteral {

    /// The hex value as a string
    var hexValue: String { get }

    /// Makes a new instance using the specified hex value as a string
    ///
    /// - Parameter hexValue: The hex value as a string
    init(hexValue: String)

}

extension RGBColorModel {

    /// Returns the hex value for an RGB color
    public var hexValue: String { fatalError() }

}

extension CMYK {

    /// Returns the hex value for a CMYK color
    public var hexValue: String { fatalError() }

}

extension ExpressibleAsHexadecimal where Self == RGB {

    /// Makes an RGB representation of the specified hex value
    ///
    /// - Parameter hexValue: The RGB hex value of this color
    public init(hexValue: String) { fatalError() }

}

extension ExpressibleAsHexadecimal where Self == HSV {

    /// Makes an HSV representation of the specified hex value
    ///
    /// - Parameter hexValue: The RGB hexValue representation of this color
    public init(hexValue: String) { fatalError() }

}

extension ExpressibleAsHexadecimal where Self == HSL {

    /// Makes an HSL representation of the specified hex value
    ///
    /// - Parameter hexValue: The RGB hexValue representation of this color
    public init(hexValue: String) { fatalError() }

}

extension ExpressibleAsHexadecimal where Self == CMYK {

    /// Makes an CMYK representation of the specified hex value
    ///
    /// - Parameter hexValue: The CMYK hex value of this color
    public init(hexValue: String) { fatalError() }

}

// Adds ExpressibleAsHexadecimal conformance to any color where its model also conforms
extension Color: ExpressibleAsHexadecimal where Model: ExpressibleAsHexadecimal {

    /// Returns the hex value for this color
    public var hexValue: String {
        return model.hexValue
    }

    /// Makes a new color from a hex value
    ///
    /// - Parameter hexValue: The hex representation of this color
    public init(hexValue: String) {
        self.init(ModelType(hexValue: hexValue))
    }

}

extension Color: ExpressibleByUnicodeScalarLiteral where Model: ExpressibleAsHexadecimal {
    public typealias UnicodeScalarLiteralType = String
}

extension Color: ExpressibleByExtendedGraphemeClusterLiteral where Model: ExpressibleAsHexadecimal {
    public typealias ExtendedGraphemeClusterLiteralType = String
}

extension Color: ExpressibleByStringLiteral where Model: ExpressibleAsHexadecimal {
    public typealias StringLiteralType = String
}

// MARK: - String Literal Support for Hex Values

extension ExpressibleAsHexadecimal {
    public init(stringLiteral value: String) {
        self.init(hexValue: value)
    }

    public init(extendedGraphemeClusterLiteral value: String) {
        self.init(hexValue: value)
    }

    public init(unicodeScalarLiteral value: String) {
        self.init(hexValue: value)
    }
}
