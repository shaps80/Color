//
//  Color+Spec.swift
//  Color+Demo
//
//  Created by Shaps Benkau on 10/07/2018.
//Copyright © 2018 152 Percent Ltd. All rights reserved.
//

import Quick
import Nimble

@testable import Color

final class Color_Spec: QuickSpec {
    
    override func spec() {
        describe("when initialising a color") {
            it("it should initialise correctly") {
                let color = Color(white: 1, alpha: 1)
                expect(color).to(equal(NSColor(white: 1, alpha: 1)))
            }
        }
    }
    
}
