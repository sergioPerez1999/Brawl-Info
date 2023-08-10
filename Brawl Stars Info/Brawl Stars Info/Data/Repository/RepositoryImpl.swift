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
        let information = Information(brawlers: brawlers, maps: maps)
        
        return information
    }
    
    func getBrawlers() async throws -> [Brawler] {
        return try await remoteDataSource.getBrawlers().list
    }
    
    func getMaps() async throws -> [Map] {
        return try await remoteDataSource.getMaps().list
    }
    
    func getGames() async throws -> [Game] {
        return try await remoteDataSource.getGames().list
    }
    
}
