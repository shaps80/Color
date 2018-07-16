//
//  Color.swift
//  Color+macOS
//
//  Created by Shaps Benkau on 16/07/2018.
//  Copyright © 2018 152 Percent Ltd. All rights reserved.
//

import Foundation

/// Defines a protocol for representing color values
public protocol ColorProtocol {

    /// The underlying model type that will represent this color
    associatedtype ModelType: ColorModel

    /// The underying model for this color
    var model: ModelType { get }

    /// Makes a new color using the specified model
    ///
    /// - Parameter model: The model for this color
    init(_ model: ModelType)
    
}

/// Defines an RGB color value
public struct Color<Model>: ColorProtocol where Model: ColorModel {

    /// The model type for this color, either RGB, HSL or HSV
    public typealias ModelType = Model

    /// The underlying model value
    public var model: Model

    /// Makes a new RGB color value using the specified model
    ///
    /// - Parameter model: The RGB model for this color
    public init(_ model: Model) {
        self.model = model
    }

}
