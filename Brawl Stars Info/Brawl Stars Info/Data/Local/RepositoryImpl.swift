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
    
    func getBrawlers() async throws -> BrawlerList {
        return try await remoteDataSource.getBrawlers()
    }
    
    
}
