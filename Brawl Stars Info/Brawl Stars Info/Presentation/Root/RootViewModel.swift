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
    @Published var maps: [Mapa] = []
    @Published var games: [Game] = []
    
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
