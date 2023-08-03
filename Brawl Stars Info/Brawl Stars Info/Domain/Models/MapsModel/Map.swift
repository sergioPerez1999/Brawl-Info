//
//  Map.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 3/8/23.
//

import Foundation
struct Map: Decodable, Identifiable {
    
    let id: Int
    let name: String
    let link: URL
    let imageUrl: URL
    let gameMode: GameModeMap
    
}
