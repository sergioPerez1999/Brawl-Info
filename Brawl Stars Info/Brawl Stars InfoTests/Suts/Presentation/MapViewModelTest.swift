//
//  MapViewModelTest.swift
//  Brawl Stars InfoTests
//
//  Created by Pérez Cubedo Sergio on 8/8/23.
//

import XCTest
@testable import Brawl_Stars_Info


final class MapViewModelTest: XCTestCase {

    var sut: MapViewModel?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = MapViewModel(repository: RepositoryMock())
        
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testMapViewModel_whenGetMaps_expectMaps() throws {
        
        let expectation = XCTestExpectation(description: "ERROR")
        self.sut?.getMaps() {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
        XCTAssertNotNil(self.sut?.maps, "Error: Maps is nil")
        XCTAssertNotEqual(self.sut?.maps.count, 0, "Error: Maps is empty")
        
        
    }
    
    func testMapViewModel_whenSortOptionName_expectOrderedMapsByName() throws {
        // GIVEN a home view model with brawlers
        
        let maps = [Map(id: 1, name: "name1", link: URL(string: "link1")!, imageUrl: URL(string: "image1")!, gameMode: .init(id: nil, name: "game1", imageUrl: URL(string: "https://cdn-old.brawlify.com/gamemode/Bot-Drop.png")!)),
                    Map(id: 2, name: "name2", link: URL(string: "link2")!, imageUrl: URL(string: "image2")!, gameMode: .init(id: nil, name: "game2", imageUrl: URL(string: "https://cdn-old.brawlify.com/gamemode/Bot-Drop.png")!)),
                    Map(id: 3, name: "name3", link: URL(string: "link3")!, imageUrl: URL(string: "image3")!, gameMode: .init(id: nil, name: "game3", imageUrl: URL(string: "https://cdn-old.brawlify.com/gamemode/Bot-Drop.png")!))]
        sut?.maps = maps
        sut?.sortOptionMap = .name
        XCTAssertNotNil(sut?.sortedMaps.first, "Error: Maps don't exists")
        XCTAssertEqual(sut?.sortedMaps.count, 3, "Error: The number of maps don't match")
        XCTAssertEqual(sut?.sortedMaps.first?.name, "name1")
    }
    
    func testMapViewModel_whenSortOptionGame_expectOrderedMapsByGame() throws {
        // GIVEN a home view model with brawlers
        
        let maps = [Map(id: 1, name: "name1", link: URL(string: "link1")!, imageUrl: URL(string: "image1")!, gameMode: .init(id: nil, name: "game1", imageUrl: URL(string: "https://cdn-old.brawlify.com/gamemode/Bot-Drop.png")!)),
                    Map(id: 2, name: "name2", link: URL(string: "link2")!, imageUrl: URL(string: "image2")!, gameMode: .init(id: nil, name: "game2", imageUrl: URL(string: "https://cdn-old.brawlify.com/gamemode/Bot-Drop.png")!)),
                    Map(id: 3, name: "name3", link: URL(string: "link3")!, imageUrl: URL(string: "image3")!, gameMode: .init(id: nil, name: "agame3", imageUrl: URL(string: "https://cdn-old.brawlify.com/gamemode/Bot-Drop.png")!))]
        sut?.maps = maps
        sut?.sortOptionMap = .game
        XCTAssertNotNil(sut?.sortedMaps.first, "Error: Maps don't exists")
        XCTAssertEqual(sut?.sortedMaps.count, 3, "Error: The number of maps don't match")
        XCTAssertEqual(sut?.sortedMaps.first?.name, "name3")
    }
    func testMapViewModel_whenSearchOptionNotEmpty_expectSearchedMaps() throws {
        // GIVEN a home view model with brawlers
        
        let maps = [Map(id: 1, name: "name1", link: URL(string: "link1")!, imageUrl: URL(string: "image1")!, gameMode: .init(id: nil, name: "game1", imageUrl: URL(string: "https://cdn-old.brawlify.com/gamemode/Bot-Drop.png")!)),
                    Map(id: 2, name: "name2", link: URL(string: "link2")!, imageUrl: URL(string: "image2")!, gameMode: .init(id: nil, name: "game2", imageUrl: URL(string: "https://cdn-old.brawlify.com/gamemode/Bot-Drop.png")!)),
                    Map(id: 3, name: "name3", link: URL(string: "link3")!, imageUrl: URL(string: "image3")!, gameMode: .init(id: nil, name: "agame3", imageUrl: URL(string: "https://cdn-old.brawlify.com/gamemode/Bot-Drop.png")!))]
        sut?.maps = maps
        sut?.sortOptionMap = .name
        sut?.searchTextMap = "name2"
        XCTAssertNotNil(sut?.searchedMaps.first, "Error: Maps don't exists")
        XCTAssertEqual(sut?.searchedMaps.count, 1, "Error: The number of maps don't match")
        XCTAssertEqual(sut?.searchedMaps.first?.name, "name2")
    }
    
    func testMapViewModel_whenSearchOptionNotEmpty_expectEmptyMaps() throws {
        // GIVEN a home view model with brawlers
        
        let maps = [Map(id: 1, name: "name1", link: URL(string: "link1")!, imageUrl: URL(string: "image1")!, gameMode: .init(id: nil, name: "game1", imageUrl: URL(string: "https://cdn-old.brawlify.com/gamemode/Bot-Drop.png")!)),
                    Map(id: 2, name: "name2", link: URL(string: "link2")!, imageUrl: URL(string: "image2")!, gameMode: .init(id: nil, name: "game2", imageUrl: URL(string: "https://cdn-old.brawlify.com/gamemode/Bot-Drop.png")!)),
                    Map(id: 3, name: "name3", link: URL(string: "link3")!, imageUrl: URL(string: "image3")!, gameMode: .init(id: nil, name: "agame3", imageUrl: URL(string: "https://cdn-old.brawlify.com/gamemode/Bot-Drop.png")!))]
        sut?.maps = maps
        sut?.sortOptionMap = .name
        sut?.searchTextMap = "name4"
        XCTAssertEqual(sut?.searchedMaps.count, 0, "Error: The number of maps don't match")
    }
    
    func testMapViewModel_whenSearchOptionEmpty_expectAllMaps() throws {
        // GIVEN a home view model with brawlers
        
        let maps = [Map(id: 1, name: "name1", link: URL(string: "link1")!, imageUrl: URL(string: "image1")!, gameMode: .init(id: nil, name: "game1", imageUrl: URL(string: "https://cdn-old.brawlify.com/gamemode/Bot-Drop.png")!)),
                    Map(id: 2, name: "name2", link: URL(string: "link2")!, imageUrl: URL(string: "image2")!, gameMode: .init(id: nil, name: "game2", imageUrl: URL(string: "https://cdn-old.brawlify.com/gamemode/Bot-Drop.png")!)),
                    Map(id: 3, name: "name3", link: URL(string: "link3")!, imageUrl: URL(string: "image3")!, gameMode: .init(id: nil, name: "agame3", imageUrl: URL(string: "https://cdn-old.brawlify.com/gamemode/Bot-Drop.png")!))]
        sut?.maps = maps
        sut?.sortOptionMap = .name
        sut?.searchTextMap = ""
        XCTAssertNotNil(sut?.searchedMaps.first, "Error: Maps don't exists")
        XCTAssertEqual(sut?.searchedMaps.count, 3, "Error: The number of maps don't match")
        XCTAssertEqual(sut?.searchedMaps.first?.name, "name1")
    }

}
