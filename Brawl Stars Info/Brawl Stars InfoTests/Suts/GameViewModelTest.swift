//
//  GameViewModelTest.swift
//  Brawl Stars InfoTests
//
//  Created by Pérez Cubedo Sergio on 8/8/23.
//

import XCTest
@testable import Brawl_Stars_Info

final class GameViewModelTest: XCTestCase {

    var sut: GameViewModel?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = GameViewModel(repository: RepositoryMock())
        
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testGameViewModel_whenGetGames_expectGames() throws {
        
        let expectation = XCTestExpectation(description: "ERROR")
        self.sut?.getGames() {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
        XCTAssertNotNil(self.sut?.games, "Error: Games is nil")
        XCTAssertNotEqual(self.sut?.games.count, 0, "Error: Games is empty")
    }
    
    
    func testGameViewModel_whenSearchOptionNotEmpty_expectSearchedBrawlers() throws {
        // GIVEN a home view model with brawlers
        
        let games = [
            Game(id: 1, name: "name1", color: "sdfg", title: "title1", description: "description1", link: URL(string: "url1")!, imageUrl: URL(string: "image1")!),
            Game(id: 1, name: "name2", color: "sdfg", title: "title2", description: "description2", link: URL(string: "url2")!, imageUrl: URL(string: "image2")!),
            Game(id: 1, name: "name3", color: "sdfg", title: "title3", description: "description3", link: URL(string: "url3")!, imageUrl: URL(string: "image3")!)
        ]
        sut?.games = games
        sut?.searchTextGame = "name2"
        XCTAssertNotNil(sut?.searchedGames.first, "Error: Games don't exists")
        XCTAssertEqual(sut?.searchedGames.count, 1, "Error: The number of games don't match")
        XCTAssertEqual(sut?.searchedGames.first?.name, "name2")
    }
    
    func testGameViewModel_whenSearchOptionNotEmpty_expectEmptyBrawlers() throws {
        // GIVEN a home view model with brawlers
        
        let games = [
            Game(id: 1, name: "name1", color: "sdfg", title: "title1", description: "description1", link: URL(string: "url1")!, imageUrl: URL(string: "image1")!),
            Game(id: 1, name: "name2", color: "sdfg", title: "title2", description: "description2", link: URL(string: "url2")!, imageUrl: URL(string: "image2")!),
            Game(id: 1, name: "name3", color: "sdfg", title: "title3", description: "description3", link: URL(string: "url3")!, imageUrl: URL(string: "image3")!)
        ]
        sut?.games = games
        sut?.searchTextGame = "name4"
        XCTAssertEqual(sut?.searchedGames.count, 0, "Error: The number of games don't match")
    }
    
    func testGameViewModel_whenSearchOptionEmpty_expectAllBrawlers() throws {
        // GIVEN a home view model with brawlers
        
        let games = [
            Game(id: 1, name: "name1", color: "sdfg", title: "title1", description: "description1", link: URL(string: "url1")!, imageUrl: URL(string: "image1")!),
            Game(id: 1, name: "name2", color: "sdfg", title: "title2", description: "description2", link: URL(string: "url2")!, imageUrl: URL(string: "image2")!),
            Game(id: 1, name: "name3", color: "sdfg", title: "title3", description: "description3", link: URL(string: "url3")!, imageUrl: URL(string: "image3")!)
        ]
        sut?.games = games
        sut?.searchTextGame = ""
        XCTAssertNotNil(sut?.searchedGames.first, "Error: Games don't exists")
        XCTAssertEqual(sut?.searchedGames.count, 3, "Error: The number of games don't match")
        XCTAssertEqual(sut?.searchedGames.first?.name, "name1")
    }

}
