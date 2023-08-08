//
//  HomeViewModelTest.swift
//  Brawl Stars InfoTests
//
//  Created by Pérez Cubedo Sergio on 8/8/23.
//

import XCTest
@testable import Brawl_Stars_Info

final class HomeViewModelTest: XCTestCase {
    
    var sut: HomeViewModel?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = HomeViewModel(repository: RepositoryMock())
        
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testHomeViewModel_whenGetBrawlers_expectBrawlers() throws {
        
        let expectation = XCTestExpectation(description: "ERROR")
        self.sut?.getBrawlers() {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
        XCTAssertNotNil(self.sut?.brawlers, "Error: Brawlers is nil")
        XCTAssertNotEqual(self.sut?.brawlers.count, 0, "Error: brawlers is empty")
    }
    
    func testHomeViewModel_whenSortOptionName_expectOrderedBrawlersByName() throws {
        // GIVEN a home view model with brawlers
        
        let brawlers = [
            Brawler(id: 1, name: "name1", link: URL(string: "url1")!, imageUrl: URL(string: "url1")!, class: Clase(name: "name1"), rarity: Rarity(name: "zlast", color: "color1"), description: "no description", starPowers: [], gadgets: []),
            Brawler(id: 2, name: "name2", link: URL(string: "url2")!, imageUrl: URL(string: "url2")!, class: Clase(name: "aclass"), rarity: Rarity(name: "hmiddle", color: "color2"), description: "no description", starPowers: [], gadgets: []),
            Brawler(id: 3, name: "name3", link: URL(string: "url3")!, imageUrl: URL(string: "url3")!, class: Clase(name: "name3"), rarity: Rarity(name: "afirst", color: "color3"), description: "no description", starPowers: [], gadgets: [])
        ]
        sut?.brawlers = brawlers
        sut?.sortOption = .name
        XCTAssertNotNil(sut?.sortedBrawlers.first, "Error: Brawlers don't exists")
        XCTAssertEqual(sut?.sortedBrawlers.count, 3, "Error: The number of brawlers don't match")
        XCTAssertEqual(sut?.sortedBrawlers.first?.name, "name1")
    }
    
    func testHomeViewModel_whenSortOptionRarity_expectOrderedBrawlersByRarity() throws {
        // GIVEN a home view model with brawlers
        
        let brawlers = [
            Brawler(id: 1, name: "name1", link: URL(string: "url1")!, imageUrl: URL(string: "url1")!, class: Clase(name: "name1"), rarity: Rarity(name: "zlast", color: "color1"), description: "no description", starPowers: [], gadgets: []),
            Brawler(id: 2, name: "name2", link: URL(string: "url2")!, imageUrl: URL(string: "url2")!, class: Clase(name: "aclass"), rarity: Rarity(name: "hmiddle", color: "color2"), description: "no description", starPowers: [], gadgets: []),
            Brawler(id: 3, name: "name3", link: URL(string: "url3")!, imageUrl: URL(string: "url3")!, class: Clase(name: "name3"), rarity: Rarity(name: "afirst", color: "color3"), description: "no description", starPowers: [], gadgets: [])
        ]
        sut?.brawlers = brawlers
        sut?.sortOption = .rarity
        XCTAssertNotNil(sut?.sortedBrawlers.first, "Error: Brawlers don't exists")
        XCTAssertEqual(sut?.sortedBrawlers.count, 3, "Error: The number of brawlers don't match")
        XCTAssertEqual(sut?.sortedBrawlers.first?.name, "name3")
    }
    
    func testHomeViewModel_whenSortOptionClass_expectOrderedBrawlersByClass() throws {
        // GIVEN a home view model with brawlers
        
        let brawlers = [
            Brawler(id: 1, name: "name1", link: URL(string: "url1")!, imageUrl: URL(string: "url1")!, class: Clase(name: "name1"), rarity: Rarity(name: "zlast", color: "color1"), description: "no description", starPowers: [], gadgets: []),
            Brawler(id: 2, name: "name2", link: URL(string: "url2")!, imageUrl: URL(string: "url2")!, class: Clase(name: "aclass"), rarity: Rarity(name: "hmiddle", color: "color2"), description: "no description", starPowers: [], gadgets: []),
            Brawler(id: 3, name: "name3", link: URL(string: "url3")!, imageUrl: URL(string: "url3")!, class: Clase(name: "name3"), rarity: Rarity(name: "afirst", color: "color3"), description: "no description", starPowers: [], gadgets: [])
        ]
        sut?.brawlers = brawlers
        sut?.sortOption = .`class`
        XCTAssertNotNil(sut?.sortedBrawlers.first, "Error: Brawlers don't exists")
        XCTAssertEqual(sut?.sortedBrawlers.count, 3, "Error: The number of brawlers don't match")
        XCTAssertEqual(sut?.sortedBrawlers.first?.name, "name2")
    }
    
    
    func testHomeViewModel_whenSearchOptionNotEmpty_expectSearchedBrawlers() throws {
        // GIVEN a home view model with brawlers
        
        let brawlers = [
            Brawler(id: 1, name: "name1", link: URL(string: "url1")!, imageUrl: URL(string: "url1")!, class: Clase(name: "name1"), rarity: Rarity(name: "zlast", color: "color1"), description: "no description", starPowers: [], gadgets: []),
            Brawler(id: 2, name: "name2", link: URL(string: "url2")!, imageUrl: URL(string: "url2")!, class: Clase(name: "aclass"), rarity: Rarity(name: "hmiddle", color: "color2"), description: "no description", starPowers: [], gadgets: []),
            Brawler(id: 3, name: "name3", link: URL(string: "url3")!, imageUrl: URL(string: "url3")!, class: Clase(name: "name3"), rarity: Rarity(name: "afirst", color: "color3"), description: "no description", starPowers: [], gadgets: [])
        ]
        sut?.brawlers = brawlers
        sut?.sortOption = .name
        sut?.searchText = "name1"
        XCTAssertNotNil(sut?.searchedBrawlers.first, "Error: Brawlers don't exists")
        XCTAssertEqual(sut?.searchedBrawlers.count, 1, "Error: The number of brawlers don't match")
        XCTAssertEqual(sut?.searchedBrawlers.first?.name, "name1")
    }
    
    func testHomeViewModel_whenSearchOptionNotEmpty_expectEmptyBrawlers() throws {
        // GIVEN a home view model with brawlers
        
        let brawlers = [
            Brawler(id: 1, name: "name1", link: URL(string: "url1")!, imageUrl: URL(string: "url1")!, class: Clase(name: "name1"), rarity: Rarity(name: "zlast", color: "color1"), description: "no description", starPowers: [], gadgets: []),
            Brawler(id: 2, name: "name2", link: URL(string: "url2")!, imageUrl: URL(string: "url2")!, class: Clase(name: "aclass"), rarity: Rarity(name: "hmiddle", color: "color2"), description: "no description", starPowers: [], gadgets: []),
            Brawler(id: 3, name: "name3", link: URL(string: "url3")!, imageUrl: URL(string: "url3")!, class: Clase(name: "name3"), rarity: Rarity(name: "afirst", color: "color3"), description: "no description", starPowers: [], gadgets: [])
        ]
        sut?.brawlers = brawlers
        sut?.sortOption = .name
        sut?.searchText = "name4"
        XCTAssertEqual(sut?.searchedBrawlers.count, 0, "Error: The number of brawlers don't match")
    }
    
    func testHomeViewModel_whenSearchOptionEmpty_expectAllBrawlers() throws {
        // GIVEN a home view model with brawlers
        
        let brawlers = [
            Brawler(id: 1, name: "name1", link: URL(string: "url1")!, imageUrl: URL(string: "url1")!, class: Clase(name: "name1"), rarity: Rarity(name: "zlast", color: "color1"), description: "no description", starPowers: [], gadgets: []),
            Brawler(id: 2, name: "name2", link: URL(string: "url2")!, imageUrl: URL(string: "url2")!, class: Clase(name: "aclass"), rarity: Rarity(name: "hmiddle", color: "color2"), description: "no description", starPowers: [], gadgets: []),
            Brawler(id: 3, name: "name3", link: URL(string: "url3")!, imageUrl: URL(string: "url3")!, class: Clase(name: "name3"), rarity: Rarity(name: "afirst", color: "color3"), description: "no description", starPowers: [], gadgets: [])
        ]
        sut?.brawlers = brawlers
        sut?.sortOption = .name
        sut?.searchText = ""
        XCTAssertNotNil(sut?.searchedBrawlers.first, "Error: Brawlers don't exists")
        XCTAssertEqual(sut?.searchedBrawlers.count, 3, "Error: The number of brawlers don't match")
        XCTAssertEqual(sut?.searchedBrawlers.first?.name, "name1")
    }
}
