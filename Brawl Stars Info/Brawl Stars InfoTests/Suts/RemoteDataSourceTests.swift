//
//  RemoteDataSourceTests.swift
//  Brawl Stars InfoTests
//
//  Created by Pérez Cubedo Sergio on 3/8/23.
//

import XCTest
@testable import Brawl_Stars_Info

final class RemoteDataSourceTests: XCTestCase {

    var sut: RemoteDataSourceProtocol?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = RemoteDataSourceImpl()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testRemoteDataSource_whenGetBrawlersMockURLSession_expectBrawlers() async throws {
        
        
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [URLProtocolMock.self]
        
        let mockURLSession = URLSession.init(configuration: configuration)
        sut = RemoteDataSourceImpl(session: mockURLSession)
        
        URLProtocolMock.requestHandler = { request in
            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields:  nil)!
            let brawlers = BrawlerList(list: [Brawler(id: 16000000,
                                                                  name: "Shelly",
                                                                  link: URL(string: "https://brawlify.com/brawlers/detail/Shelly")!,
                                                                  imageUrl: URL(string: "https://cdn-old.brawlify.com/brawler/Shelly.png")!,
                                                                  class: .init(name: "Damage Dealer"),
                                                                  rarity: .init(name: "Common", color: "#b9eaff"),
                                                                  description: "Shelly's spread-fire shotgun blasts the other team with buckshot. Her Super destroys cover and keeps her opponents at a distance!",
                                                                  starPowers: [
                                                                    .init(id: 23000076, name: "Shell Shock", description: "Shelly's Super shells slow down enemies for x seconds!", imageUrl: URL(string: "https://cdn-old.brawlify.com/star-powers/Full.png")!),
                                                                    .init(id: 23000135, name: "Band-Aid", description: "When Shelly falls below x% health, she instantly heals for x health. Band-Aid recharges in x seconds.", imageUrl: URL(string: "https://cdn-old.brawlify.com/star-powers/Full.png")!)
                                                                  ],
                                                                  gadgets: [
                                                                    .init(id: 23000255, name: "Fast Forward", description: "Shelly dashes ahead, skipping a few unnecessary steps!", imageUrl: URL(string: "https://cdn-old.brawlify.com/gadgets/Full.png")!)
                                                                  ])])
            let data = try JSONEncoder().encode(brawlers)
            return (response, data)
        }
        
        guard let brawlers = try? await sut?.getBrawlers() else {
            XCTFail("Brawlers must contain a brawler")
            return
        }
        XCTAssertNotNil(brawlers.list.first)
        XCTAssertEqual(brawlers.list.first?.name, "Shelly")
        
        
    }
    
    func testRemoteDataSource_whenGetMapsMockURLSession_expectMaps() async throws {
        
        
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [URLProtocolMock.self]
        
        let mockURLSession = URLSession.init(configuration: configuration)
        sut = RemoteDataSourceImpl(session: mockURLSession)
        
        URLProtocolMock.requestHandler = { request in
            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields:  nil)!
            let maps = MapList(list: [.init(id: 15000511, name: "Devolution", link: URL(string: "https://brawlify.com/maps/detail/Devolution")!, imageUrl: URL(string: "https://cdn-old.brawlify.com/map/15000511.png")!, gameMode: .init(id: nil, name: "Bot Drop", imageUrl: URL(string: "https://cdn-old.brawlify.com/gamemode/Bot-Drop.png")!))])
            let data = try JSONEncoder().encode(maps)
            return (response, data)
        }
        
        guard let maps = try? await sut?.getMaps() else {
            XCTFail("Maps must contain a map")
            return
        }
        XCTAssertNotNil(maps.list.first)
        XCTAssertEqual(maps.list.first?.name, "Devolution")
        
        
    }
    
    func testRemoteDataSource_whenGetGamesMockURLSession_expectGames() async throws {
        
        
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [URLProtocolMock.self]
        
        let mockURLSession = URLSession.init(configuration: configuration)
        sut = RemoteDataSourceImpl(session: mockURLSession)
        
        URLProtocolMock.requestHandler = { request in
            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields:  nil)!
            let games = GameList(list: [.init(id: nil, name: "Bot Drop", color: "#ff4343", title: "3 vs 3", description: "Defend against the robot invasion. Destroy robots and collect bolts. First team to collect <MAX_SCORE> bolts wins the match!", link: URL(string: "https://brawlify.com/gamemodes/detail/Bot-Drop")!, imageUrl: URL(string: "https://cdn-old.brawlify.com/gamemode/Bot-Drop.png")!)])
            let data = try JSONEncoder().encode(games)
            return (response, data)
        }
        
        guard let games = try? await sut?.getGames() else {
            XCTFail("Games must contain a game")
            return
        }
        XCTAssertNotNil(games.list.first)
        XCTAssertEqual(games.list.first?.name, "Bot Drop")
        
        
    }

}
