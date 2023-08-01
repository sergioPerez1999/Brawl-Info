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
    private let repository: RepositoryProtocol
    @Published var status = Status.primary
    
    init(repository: RepositoryProtocol, status: Status = Status.primary) {
        self.repository = repository
        self.status = status
    }
    func getInformation() {
        status = .loading
        Task {
            guard let brawlersFromApi = try? await repository.getBrawlers() else {
                print("Unable to get brawlers")
                return
            }
            print(brawlersFromApi)
        }
        status = .loaded
    }
    
    func goToHome() {
        status = .primary
    }
    
}
