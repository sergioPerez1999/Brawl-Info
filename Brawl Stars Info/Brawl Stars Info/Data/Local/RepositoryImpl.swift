//
//  RepositoryImpl.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 1/8/23.
//

import Foundation


final class RepositoryImpl: RepositoryProtocol {
    
    private let remoteDataSource: RemoteDataSourceProtocol
    
    init(remoteDataSource: RemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getInformation() async throws -> Information {
        let brawlers = try await remoteDataSource.getBrawlers().list
        let maps = try await remoteDataSource.getMaps().list
        let games = try await remoteDataSource.getGames().list
        let information = Information(brawlers: brawlers, maps: maps, games: games)
        
        return information
    }
    
}
