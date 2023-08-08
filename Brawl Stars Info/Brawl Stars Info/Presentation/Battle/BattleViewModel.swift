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
    @Published var brawlerSelected: Int = 0
    @Published var mapSelected: Int = 0
    @Published var isAlertPresented: Bool = false
    @Published var alertMessage = ""
    
    var numberOfPlayers: GameModeEnum {
        let gameMode = maps.filter { $0.id == mapSelected }
        switch gameMode[0].gameMode.name {
        case "Big Game":
            return .fivePlayers
        case "Takedown", "Solo Showdown", "Hunters", "Lone Star":
            return .onePlayer
        case "Duo Showdown":
            return .twoPlayers
        case "Boss Fight", "Robo Rumble", "Last Stand", "Super City Rampage":
            return .threePlayers
        case "Duels":
            return .oneVSone
        default:
            return .threeVSthree
        }
    }
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
        getInformation()
    }
    
    func getInformation(completion: @escaping () -> () = {}) {
        DispatchQueue.main.async {
            Task {
                guard let informationFromApi = try? await self.repository.getInformation() else {
                    print("Unable to get information")
                    return
                }
                self.brawlers = informationFromApi.brawlers
                self.maps = informationFromApi.maps
                self.brawlerSelected = self.brawlers[0].id
                self.mapSelected = self.maps[0].id
                completion()
                
            }
        }
    }
    func startBattle() {
        let numberEnum = numberOfPlayers
        let brawler = brawlers.filter { $0.id == brawlerSelected }[0]
        let map = maps.filter { $0.id == mapSelected }[0]
        
        switch numberEnum {
        case .fivePlayers:
            let number = Int.random(in: 1...2)
            switch number {
            case 1:
                alertMessage = "Your team formed by \(brawler.name), \(brawlers.randomElement()?.name ?? brawler.name), \(brawlers.randomElement()?.name ?? brawler.name), \(brawlers.randomElement()?.name ?? brawler.name), \(brawlers.randomElement()?.name ?? brawler.name) have won playing vs \(brawlers.randomElement()?.name ?? brawler.name) in \(map.name) playing \(map.gameMode.name).\nCongratulations 🎊!"
            case 2:
                alertMessage = "Your team formed by \(brawler.name), \(brawlers.randomElement()?.name ?? brawler.name), \(brawlers.randomElement()?.name ?? brawler.name), \(brawlers.randomElement()?.name ?? brawler.name), \(brawlers.randomElement()?.name ?? brawler.name) have lost playing vs \(brawlers.randomElement()?.name ?? brawler.name) in \(map.name) playing \(map.gameMode.name).\nNext time will be 😥!"
            default:
                alertMessage = ""
            }
            isAlertPresented = true
        case .onePlayer:
            let number = Int.random(in: 1...10)
            switch number {
            case 1:
                alertMessage = "You have won in \(map.gameMode.name), at the map \(map.name).\nCongratulations, \(brawler.name) 🎊!"
            default:
                alertMessage = "You did not won, you have reached the \(number) position in \(map.gameMode.name), at the map \(map.name).\nNext time will be, \(brawler.name) 😥!"
            }
            isAlertPresented = true
        case .oneVSone:
            let number = Int.random(in: 1...2)
            switch number {
            case 1:
                alertMessage = "You have won to \(brawlers.randomElement()?.name ?? brawler.name).\nCongratulations \(brawler.name) 🎊!"
            case 2:
                alertMessage = "You have lost vs \(brawlers.randomElement()?.name ?? brawler.name).\nNext time will be, \(brawler.name) 😥!"
            default:
                alertMessage = ""
            }
            isAlertPresented = true
        case .threePlayers:
            let number = Int.random(in: 1...2)
            switch number {
            case 1:
                alertMessage = "Your team formed by \(brawler.name), \(brawlers.randomElement()?.name ?? brawler.name), \(brawlers.randomElement()?.name ?? brawler.name) have won in \(map.name) playing \(map.gameMode.name).\nCongratulations 🎊!"
            case 2:
                alertMessage = "Your team formed by \(brawler.name), \(brawlers.randomElement()?.name ?? brawler.name), \(brawlers.randomElement()?.name ?? brawler.name) have lost playing in \(map.name) playing \(map.gameMode.name).\nNext time will be 😥!"
            default:
                alertMessage = ""
            }
            isAlertPresented = true
        case  .threeVSthree:
            let number = Int.random(in: 1...3)
            switch number {
            case 1:
                alertMessage = "Your team formed by \(brawler.name), \(brawlers.randomElement()?.name ?? brawler.name), \(brawlers.randomElement()?.name ?? brawler.name) have won playing vs the team formed by \(brawlers.randomElement()?.name ?? brawler.name), \(brawlers.randomElement()?.name ?? brawler.name), \(brawlers.randomElement()?.name ?? brawler.name) in \(map.name) playing \(map.gameMode.name).\nCongratulations 🎊!"
            case 2:
                alertMessage = "Your team formed by \(brawler.name), \(brawlers.randomElement()?.name ?? brawler.name), \(brawlers.randomElement()?.name ?? brawler.name) have lost playing vs the team formed by \(brawlers.randomElement()?.name ?? brawler.name), \(brawlers.randomElement()?.name ?? brawler.name), \(brawlers.randomElement()?.name ?? brawler.name) in \(map.name) playing \(map.gameMode.name).\nNext time will be 😥!"
            case 3:
                alertMessage = "Your team formed by \(brawler.name), \(brawlers.randomElement()?.name ?? brawler.name), \(brawlers.randomElement()?.name ?? brawler.name) have tie playing vs the team formed by \(brawlers.randomElement()?.name ?? brawler.name), \(brawlers.randomElement()?.name ?? brawler.name), \(brawlers.randomElement()?.name ?? brawler.name) in \(map.name) playing \(map.gameMode.name).\nAlmost got it 😐!"
            default:
                alertMessage = ""
            }
            isAlertPresented = true
        case .twoPlayers:
            let number = Int.random(in: 1...5)
            switch number {
            case 1:
                alertMessage = "Your team formed by \(brawler.name), \(brawlers.randomElement()?.name ?? brawler.name) have won in \(map.gameMode.name), at the map \(map.name).\nCongratulations 🎊!"
            default:
                alertMessage = "Your team formed by \(brawler.name), \(brawlers.randomElement()?.name ?? brawler.name) did not won, you have reached the \(number) position in \(map.gameMode.name), at the map \(map.name).\nNext time will be 😥!"
            }
            isAlertPresented = true
        }
        
    }
    
    
    
}
