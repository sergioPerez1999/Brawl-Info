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
    
    
}
