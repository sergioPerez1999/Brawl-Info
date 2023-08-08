//
//  MapViewModel.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 7/8/23.
//

import Foundation



final class MapViewModel: ObservableObject {
    
    let repository: RepositoryProtocol
    
    @Published var maps: [Map] = []
    @Published var searchTextMap = ""
    @Published var sortOptionMap: SortOptionsEnumMap = .name
    
    var searchedMaps: [Map] {
        let maps = sortedMaps
        guard !searchTextMap.isEmpty else { return maps }
        return maps.filter { $0.name.lowercased().contains(searchTextMap.lowercased()) }
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
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
        getMaps()
    }
    
    func getMaps(completion: @escaping () -> () = {}) {
        DispatchQueue.main.async {
            Task {
                guard let mapsFromApi = try? await self.repository.getMaps() else {
                    print("Unable to get information")
                    return
                }
                self.maps = mapsFromApi
                completion()
            }
        }
    }
    
}
