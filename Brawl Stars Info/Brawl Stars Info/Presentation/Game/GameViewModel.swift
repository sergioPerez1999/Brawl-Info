//
//  GameViewModel.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 7/8/23.
//

import Foundation


final class GameViewModel: ObservableObject {
    let repository: RepositoryProtocol
    
    @Published var games: [Game] = []
    @Published var searchTextGame = ""
    
    var searchedGames: [Game] {
        let games = self.games
        guard !searchTextGame.isEmpty else { return games }
        return games.filter { $0.name.lowercased().contains(searchTextGame.lowercased()) }
    }
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
        getGames()
    }
    
    
    func getGames(completion: @escaping () -> () = {}) {
        DispatchQueue.main.async {
            Task {
                guard let gamesFromApi = try? await self.repository.getGames() else {
                    print("Unable to get information")
                    return
                }
                self.games = gamesFromApi
                completion()
            }
        }
    }
    
}
