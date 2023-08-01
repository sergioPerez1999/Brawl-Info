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
    @Published var status = Status.primary
    @Published var heroes: [Brawler] = []
    
    init(status: Status = Status.primary) {
        self.status = status
    }
    func getBrawlers() {
        status = .loading
        
        status = .loaded
    }
    
    func goToHome() {
        status = .primary
    }
    
}
