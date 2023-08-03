//
//  RootViewModel.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 1/8/23.
//

import Foundation
import Combine

enum Status {
    case primary, loading, loaded, error(error: String)
}

final class RootViewModel: ObservableObject {
    let repository: RepositoryProtocol
    @Published var status = Status.primary
    @Published var brawlers: [Brawler] = []
    @Published var maps: [Map] = []
    @Published var games: [Game] = []
    @Published var searchText = ""
    @Published var sortOption: SortOptionsEnum = .name
    @Published var searchTextMap = ""
    @Published var sortOptionMap: SortOptionsEnumMap = .name
    @Published var searchTextGame = ""
    
    var sortedBrawlers: [Brawler] {
        let brawlers = self.brawlers
        switch sortOption {
        case .name:
            return brawlers.sorted { $0.name < $1.name }
        case .rarity:
            return brawlers.sorted { $0.rarity.name < $1.rarity.name }
        case .`class`:
            return brawlers.sorted { $0.`class`.name > $1.`class`.name }
        }
    }
    
    var sortedMaps: [Map] {
        let maps = self.maps
        switch sortOptionMap {
        case .name:
            return maps.sorted { $0.name < $1.name }
        case .game:
            return maps.sorted { $0.gameMode.name < $1.gameMode.name }
        }
    }
    var searchedMaps: [Map] {
        let maps = sortedMaps
        guard !searchTextMap.isEmpty else { return maps }
        return maps.filter { $0.name.lowercased().contains(searchTextMap.lowercased()) }
    }
    
    var searchedGames: [Game] {
        let games = self.games
        guard !searchTextGame.isEmpty else { return games }
        return games.filter { $0.name.lowercased().contains(searchTextGame.lowercased()) }
    }
    
    var searchedBrawlers: [Brawler] {
        let brawlers = sortedBrawlers
        guard !searchText.isEmpty else { return brawlers }
        return brawlers.filter { $0.name.lowercased().contains(searchText.lowercased()) }
    }
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
    }
    func getInformation() {
        
        DispatchQueue.main.async {
            self.status = .loading
            Task {
                guard let informationFromApi = try? await self.repository.getInformation() else {
                    print("Unable to get information")
                    return
                }
                self.brawlers = informationFromApi.brawlers
                self.maps = informationFromApi.maps
                self.games = informationFromApi.games
                print(informationFromApi.games)
                self.status = .loaded
            }
        }
        
    }
    
    func goToHome() {
        status = .primary
    }
    
}
