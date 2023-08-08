//
//  RepositoryProtocol.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 1/8/23.
//

import Foundation

protocol RepositoryProtocol {
    func getInformation() async throws -> Information
    func getBrawlers() async throws -> [Brawler]
    func getMaps() async throws -> [Map]
    func getGames() async throws -> [Game]
    
}
