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
    
    func testRepository_whenGetBrawlersMockRemoteDataSource_expectBrawlers() async throws {
        
        let brawlers = try await sut?.getBrawlers()
        XCTAssertNotNil(brawlers)
        XCTAssertNotNil(brawlers?.first)
        XCTAssertEqual(brawlers?.first?.name, "Shelly")
        
    }
    
    func testRepository_whenGetMapsMockRemoteDataSource_expectMaps() async throws {
        
        let maps = try await sut?.getMaps()
        XCTAssertNotNil(maps)
        XCTAssertNotNil(maps?.first)
        XCTAssertEqual(maps?.first?.name, "Devolution")
        
    }
    
    func testRepository_whenGetGamesMockRemoteDataSource_expectGames() async throws {
        
        let games = try await sut?.getGames()
        XCTAssertNotNil(games)
        XCTAssertNotNil(games?.first)
        XCTAssertEqual(games?.first?.name, "Bot Drop")
        
    }

}
