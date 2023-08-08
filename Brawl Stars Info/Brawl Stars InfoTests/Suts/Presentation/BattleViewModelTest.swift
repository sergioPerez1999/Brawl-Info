//
//  BattleViewModelTest.swift
//  Brawl Stars InfoTests
//
//  Created by Pérez Cubedo Sergio on 8/8/23.
//

import XCTest
@testable import Brawl_Stars_Info

final class BattleViewModelTest: XCTestCase {

    var sut: BattleViewModel?
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = BattleViewModel(repository: RepositoryMock())
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testBattleViewModel_whenGetInformation_expectBrawlersMaps() throws {
        let expectation = XCTestExpectation(description: "ERROR")
        self.sut?.getInformation() {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
        XCTAssertNotNil(self.sut?.maps, "Error: Maps is nil")
        XCTAssertNotEqual(self.sut?.maps.count, 0, "Error: Maps is empty")
        XCTAssertNotNil(self.sut?.brawlers, "Error: Brawlers is nil")
        XCTAssertNotEqual(self.sut?.brawlers.count, 0, "Error: Brawlers is empty")
    }

    func testBattleViewModel_whenMapSelected_expectNumberPlayersEnum() throws {
        let maps = [Map(id: 1, name: "name1", link: URL(string: "link1")!, imageUrl: URL(string: "image1")!, gameMode: .init(id: nil, name: "Big Game", imageUrl: URL(string: "https://cdn-old.brawlify.com/gamemode/Bot-Drop.png")!)),
                    Map(id: 2, name: "name2", link: URL(string: "link2")!, imageUrl: URL(string: "image2")!, gameMode: .init(id: nil, name: "Takedown", imageUrl: URL(string: "https://cdn-old.brawlify.com/gamemode/Bot-Drop.png")!)),
                    Map(id: 3, name: "name3", link: URL(string: "link3")!, imageUrl: URL(string: "image3")!, gameMode: .init(id: nil, name: "Duo Showdown", imageUrl: URL(string: "https://cdn-old.brawlify.com/gamemode/Bot-Drop.png")!)),
                    Map(id: 4, name: "name4", link: URL(string: "link4")!, imageUrl: URL(string: "image4")!, gameMode: .init(id: nil, name: "Boss Fight", imageUrl: URL(string: "https://cdn-old.brawlify.com/gamemode/Bot-Drop.png")!)),
                    Map(id: 5, name: "name5", link: URL(string: "link5")!, imageUrl: URL(string: "image5")!, gameMode: .init(id: nil, name: "Duels", imageUrl: URL(string: "https://cdn-old.brawlify.com/gamemode/Bot-Drop.png")!)),
                    Map(id: 6, name: "name6", link: URL(string: "link6")!, imageUrl: URL(string: "image6")!, gameMode: .init(id: nil, name: "game", imageUrl: URL(string: "https://cdn-old.brawlify.com/gamemode/Bot-Drop.png")!))]
        sut?.maps = maps
        sut?.mapSelected = 1
        XCTAssertEqual(sut?.numberOfPlayers, .fivePlayers)
        sut?.mapSelected = 2
        XCTAssertEqual(sut?.numberOfPlayers, .onePlayer)
        sut?.mapSelected = 3
        XCTAssertEqual(sut?.numberOfPlayers, .twoPlayers)
        sut?.mapSelected = 4
        XCTAssertEqual(sut?.numberOfPlayers, .threePlayers)
        sut?.mapSelected = 5
        XCTAssertEqual(sut?.numberOfPlayers, .oneVSone)
        sut?.mapSelected = 6
        XCTAssertEqual(sut?.numberOfPlayers, .threeVSthree)
    }
    
    func testBattleViewModel_whenStartBattleButtonPressed_expectAlert() throws {
        let maps = [Map(id: 1, name: "name1", link: URL(string: "link1")!, imageUrl: URL(string: "image1")!, gameMode: .init(id: nil, name: "Big Game", imageUrl: URL(string: "https://cdn-old.brawlify.com/gamemode/Bot-Drop.png")!)),
                    Map(id: 2, name: "name2", link: URL(string: "link2")!, imageUrl: URL(string: "image2")!, gameMode: .init(id: nil, name: "Takedown", imageUrl: URL(string: "https://cdn-old.brawlify.com/gamemode/Bot-Drop.png")!)),
                    Map(id: 3, name: "name3", link: URL(string: "link3")!, imageUrl: URL(string: "image3")!, gameMode: .init(id: nil, name: "Duo Showdown", imageUrl: URL(string: "https://cdn-old.brawlify.com/gamemode/Bot-Drop.png")!)),
                    Map(id: 4, name: "name4", link: URL(string: "link4")!, imageUrl: URL(string: "image4")!, gameMode: .init(id: nil, name: "Boss Fight", imageUrl: URL(string: "https://cdn-old.brawlify.com/gamemode/Bot-Drop.png")!)),
                    Map(id: 5, name: "name5", link: URL(string: "link5")!, imageUrl: URL(string: "image5")!, gameMode: .init(id: nil, name: "Duels", imageUrl: URL(string: "https://cdn-old.brawlify.com/gamemode/Bot-Drop.png")!)),
                    Map(id: 6, name: "name6", link: URL(string: "link6")!, imageUrl: URL(string: "image6")!, gameMode: .init(id: nil, name: "game", imageUrl: URL(string: "https://cdn-old.brawlify.com/gamemode/Bot-Drop.png")!))]
        let brawlers = [
            Brawler(id: 1, name: "name1", link: URL(string: "url1")!, imageUrl: URL(string: "url1")!, class: Clase(name: "name1"), rarity: Rarity(name: "zlast", color: "color1"), description: "no description", starPowers: [], gadgets: []),
            Brawler(id: 2, name: "name2", link: URL(string: "url2")!, imageUrl: URL(string: "url2")!, class: Clase(name: "aclass"), rarity: Rarity(name: "hmiddle", color: "color2"), description: "no description", starPowers: [], gadgets: []),
            Brawler(id: 3, name: "name3", link: URL(string: "url3")!, imageUrl: URL(string: "url3")!, class: Clase(name: "name3"), rarity: Rarity(name: "afirst", color: "color3"), description: "no description", starPowers: [], gadgets: [])
        ]
        sut?.maps = maps
        sut?.brawlers = brawlers
        sut?.brawlerSelected = 1
        sut?.mapSelected = 1
        sut?.startBattle()
        XCTAssertEqual(sut?.isAlertPresented, true, "Error: Case don't finished")
        XCTAssertNotEqual(sut?.alertMessage, "")
        sut?.mapSelected = 2
        sut?.startBattle()
        XCTAssertEqual(sut?.isAlertPresented, true, "Error: Case don't finished")
        XCTAssertNotEqual(sut?.alertMessage, "")
        sut?.mapSelected = 3
        sut?.startBattle()
        XCTAssertEqual(sut?.isAlertPresented, true, "Error: Case don't finished")
        XCTAssertNotEqual(sut?.alertMessage, "")
        sut?.mapSelected = 4
        sut?.startBattle()
        XCTAssertEqual(sut?.isAlertPresented, true, "Error: Case don't finished")
        XCTAssertNotEqual(sut?.alertMessage, "")
        sut?.mapSelected = 5
        sut?.startBattle()
        XCTAssertEqual(sut?.isAlertPresented, true, "Error: Case don't finished")
        XCTAssertNotEqual(sut?.alertMessage, "")
        sut?.mapSelected = 6
        sut?.startBattle()
        XCTAssertEqual(sut?.isAlertPresented, true, "Error: Case don't finished")
        XCTAssertNotEqual(sut?.alertMessage, "")
        
    }

}
