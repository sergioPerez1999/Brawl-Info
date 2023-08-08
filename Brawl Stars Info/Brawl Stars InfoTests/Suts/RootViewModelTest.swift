//
//  RootViewModelTest.swift
//  Brawl Stars InfoTests
//
//  Created by Pérez Cubedo Sergio on 4/8/23.
//

import XCTest

@testable import Brawl_Stars_Info

final class RootViewModelTest: XCTestCase {

    var sut: RootViewModel?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        let mockRepository = RepositoryMock()
        sut = RootViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

//    func testRootViewModel_whenGetInformation_expectInformationNotNull() throws {
//        sut?.getInformation()
//    }

}
