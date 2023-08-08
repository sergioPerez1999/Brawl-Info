//
//  RootViewModel.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 1/8/23.
//

import Foundation
import Combine

enum Status: Equatable {
    case primary, loaded, error(error: String)
}

final class RootViewModel: ObservableObject {
    @Published var status = Status.primary
    
    func goToHome() {
        status = .primary
    }
    
}
