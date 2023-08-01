//
//  RepositoryProtocol.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 1/8/23.
//

import Foundation

protocol RepositoryProtocol {
    func getBrawlers() async throws -> BrawlerList
}
