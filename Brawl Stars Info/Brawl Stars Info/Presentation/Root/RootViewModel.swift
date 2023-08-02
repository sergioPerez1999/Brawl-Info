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
    @Published var searchText = ""
    @Published var sortOption: SortOptionsEnum = .name
    
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
    var searchedBrawlers: [Brawler] {
        let brawlers = sortedBrawlers
        guard !searchText.isEmpty else { return brawlers }
        return brawlers.filter { $0.name.lowercased().contains(searchText.lowercased()) }
    }
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
    }
    func getInformation() {
        status = .loading
        DispatchQueue.main.async {
            Task {
                guard let brawlersFromApi = try? await self.repository.getBrawlers() else {
                    print("Unable to get information")
                    return
                }
                self.brawlers = brawlersFromApi
            }
        }
        status = .loaded
    }
    
    func goToHome() {
        status = .primary
    }
    
}
