//
//  RemoteDataSourceProtocol.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 1/8/23.
//

import Foundation


protocol RemoteDataSourceProtocol {
    func getBrawlers() async throws -> BrawlerList
}
