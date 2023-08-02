//
//  Map.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 2/8/23.
//

import Foundation


struct Mapa: Decodable, Identifiable {
    let id: Int
    let name: String
    let link: URL
    let imageUrl: URL
    let gameMode: GameModeMap
}
