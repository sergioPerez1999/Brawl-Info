//
//  RepositoryTest.swift
//  Brawl Stars InfoTests
//
//  Created by Pérez Cubedo Sergio on 4/8/23.
//

import XCTest
@testable import Brawl_Stars_Info


final class RepositoryTest: XCTestCase {

var sut: RepositoryProtocol?
    override func setUpWithError() throws {
        try super.setUpWithError()
            let remoteDataSource = MockRemoteDataSource()
        sut = RepositoryImpl(remoteDataSource: remoteDataSource)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testRepository_whenGetInformationMockRemoteDataSource_expectBrawlersMapsGames() async throws {
        
        let information = try await sut?.getInformation()
        XCTAssertNotNil(information)
        XCTAssertNotNil(information?.brawlers)
        XCTAssertNotNil(information?.maps)
        XCTAssertNotNil(information?.games)
        
    }

}
