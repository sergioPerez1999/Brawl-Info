//
//  ColorExtensionTest.swift
//  Brawl Stars InfoTests
//
//  Created by Pérez Cubedo Sergio on 8/8/23.
//

import XCTest
import SwiftUI
@testable import Brawl_Stars_Info


final class ColorExtensionTest: XCTestCase {

    func testColorExtension_whenColorInitHex_expectSameColorRGB() throws {
        // GIVEN a color instantiated with a 6 characters hex value and rgb
        let hexOrangeColor = Color(hex: "#FF5733")
        let rgbOrangeColor = Color(red: 1.0, green: 0.3411764705882353, blue: 0.2)
        
        // THEN
        XCTAssertEqual(hexOrangeColor, rgbOrangeColor)
        
//        // GIVEN a color instantiated with a 6 characters hex value and rgb
//        let hexOrangeColor1 = Color(hex: "lkwdsjcppwsd")
//        let rgbOrangeColor1 = Color(red: 1, green: 1, blue: 0)
//        
//        // THEN
//        XCTAssertEqual(hexOrangeColor1, rgbOrangeColor1)
    }

}
