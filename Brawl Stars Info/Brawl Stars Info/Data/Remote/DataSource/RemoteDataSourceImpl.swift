//
//  RemoteDataSourceImpl.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 1/8/23.
//

import Foundation


final class RemoteDataSourceImpl: RemoteDataSourceProtocol {
    
    private let session: NetworkFetchingProtocol
    
    init(session: NetworkFetchingProtocol = URLSession.shared) {
        self.session = session
    }
    
    func getBrawlers() async throws -> BrawlerList {
        //Usamos el async await
        guard let url = getBrawlersSession() else {
            return BrawlerList(list: [])
        }
        let (data, _) = try await session.data(url: url)
        return try JSONDecoder().decode(BrawlerList.self, from: data)
    }
    
    func getMaps() async throws -> MapList {
        guard let url = getMapsSession() else {
            return MapList(list: [])
        }
        let (data, _) = try await session.data(url: url)
        return try JSONDecoder().decode(MapList.self, from: data)
    }
    
    
    func getGames() async throws -> GameList {
        guard let url = getGamesSession() else {
            return GameList(list: [])
        }
        let (data, _) = try await session.data(url: url)
        return try JSONDecoder().decode(GameList.self, from: data)
    }
    
    
}


extension RemoteDataSourceImpl {
    func getBrawlersSession() -> URLRequest? {
        guard let url = URL(string: "https://api.brawlapi.com/v1/brawlers") else {
            print("URL Error")
            return nil
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        return urlRequest
    }
    
    func getMapsSession() -> URLRequest? {
        guard let url = URL(string: "https://api.brawlapi.com/v1/maps") else {
            print("URL Error")
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        return urlRequest
    }
    
    func getGamesSession() -> URLRequest? {
        guard let url = URL(string: "https://api.brawlapi.com/v1/gamemodes") else {
            print("URL Error")
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        return urlRequest
    }
}
