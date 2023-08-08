//
//  RepositoryMock.swift
//  Brawl Stars InfoTests
//
//  Created by Pérez Cubedo Sergio on 4/8/23.
//

import Foundation
@testable import Brawl_Stars_Info


final class RepositoryMock: RepositoryProtocol {
        
    
    func getInformation() async throws -> Information {
        let brawlers = [Brawler(id: 16000000,
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
                                ])]
        let maps = [Map(id: 15000511, name: "Devolution", link: URL(string: "https://brawlify.com/maps/detail/Devolution")!, imageUrl: URL(string: "https://cdn-old.brawlify.com/map/15000511.png")!, gameMode: .init(id: nil, name: "Bot Drop", imageUrl: URL(string: "https://cdn-old.brawlify.com/gamemode/Bot-Drop.png")!))]
        
        let information = Information(brawlers: brawlers, maps: maps)
        
        return information
    }
    
    
    func getBrawlers() async throws -> [Brawler] {
        return [Brawler(id: 16000000,
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
                        ])]
    }
    
    func getMaps() async throws -> [Map] {
        return [Map(id: 15000511, name: "Devolution", link: URL(string: "https://brawlify.com/maps/detail/Devolution")!, imageUrl: URL(string: "https://cdn-old.brawlify.com/map/15000511.png")!, gameMode: .init(id: nil, name: "Bot Drop", imageUrl: URL(string: "https://cdn-old.brawlify.com/gamemode/Bot-Drop.png")!))]
    }
    
    func getGames() async throws -> [Brawl_Stars_Info.Game] {
        return [Game(id: nil, name: "Bot Drop", color: "#ff4343", title: "3 vs 3", description: "Defend against the robot invasion. Destroy robots and collect bolts. First team to collect <MAX_SCORE> bolts wins the match!", link: URL(string: "https://brawlify.com/gamemodes/detail/Bot-Drop")!, imageUrl: URL(string: "https://cdn-old.brawlify.com/gamemode/Bot-Drop.png")!)]
    }

    
    
}
