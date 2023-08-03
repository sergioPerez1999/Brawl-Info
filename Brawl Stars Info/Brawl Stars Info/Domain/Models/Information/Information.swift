//
//  Information.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 3/8/23.
//

import Foundation


struct Information: Decodable {
    let brawlers: [Brawler]
    let maps: [Map]
    let games: [Game]
}
