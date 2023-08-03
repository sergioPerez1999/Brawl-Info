//
//  RemoteDataSourceImpl.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 1/8/23.
//

import Foundation


final class RemoteDataSourceImpl: RemoteDataSourceProtocol {
    
    
    func getBrawlers() async throws -> BrawlerList {
        //Usamos el async await
        let url = URL(string: "https://api.brawlapi.com/v1/brawlers")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(BrawlerList.self, from: data)
    }
    
    func getMaps() async throws -> MapList {
        let url = URL(string: "https://api.brawlapi.com/v1/maps")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(MapList.self, from: data)
    }
    
    
    func getGames() async throws -> GameList {
        let url = URL(string: "https://api.brawlapi.com/v1/gamemodes")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(GameList.self, from: data)
    }
    
    
}
