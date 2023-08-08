//
//  BattleViewModel.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 4/8/23.
//

import Foundation



final class BattleViewModel: ObservableObject {
    
    let repository: RepositoryProtocol
    
    
    @Published var brawlers: [Brawler] = []
    @Published var maps: [Map] = []
    
    @Published var brawler_1_1 = 0
    @Published var brawler_1_2 = 0
    @Published var brawler_1_3 = 0
    @Published var brawler_2_1 = 0
    @Published var brawler_2_2 = 0
    @Published var brawler_2_3 = 0
    
    
    @Published var mapSelected = 0
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
        getInformation()
    }
    
    func getInformation() {
        DispatchQueue.main.async {
            Task {
                guard let informationFromApi = try? await self.repository.getInformation() else {
                    print("Unable to get information")
                    return
                }
                self.brawlers = informationFromApi.brawlers
                self.maps = informationFromApi.maps
            }
        }
    }
//    func calculatePlayers(index: Int) {
//        let gameMode = maps[index].gameMode.name
//        switch gameMode {
//        case "Big Game":
//            numberPlayers = .fivePlayers
//        case "Takedown", "Solo Showdown", "Hunters", "Lone Star":
//            numberPlayers = .onePlayer
//        case "Duo Showdown":
//            numberPlayers = .twoPlayers
//        case "Boss Fight", "Robo Rumble", "Last Stand", "Super City Rampage":
//            numberPlayers = .threePlayers
//        case "Duels":
//            numberPlayers = .oneVSone
//        default:
//            numberPlayers = .threeVSthree
//        }
//    }
    
    
    
}
