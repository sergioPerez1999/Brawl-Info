//
//  HomeViewModel.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 1/8/23.
//

import Foundation


final class HomeViewModel: ObservableObject {
    private let repository: RepositoryProtocol
    @Published var brawlers: [Brawler] = []
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
        DispatchQueue.main.async {
            Task {
                guard let brawlersFromApi = try? await repository.getBrawlers() else {
                    print("Unable to get brawlers")
                    return
                }
                self.brawlers = brawlersFromApi.list
            }
        }
    }
    
    func goToHome() {
        InitView()
    }
    
}
