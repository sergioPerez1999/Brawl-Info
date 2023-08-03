//
//  GameModeMap.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 3/8/23.
//

import Foundation


struct GameModeMap: Decodable, Identifiable {
    let id: Int?
    let name: String
    let imageUrl: URL
}
