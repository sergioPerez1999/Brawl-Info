//
//  Game.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 3/8/23.
//

import Foundation


struct Game: Decodable, Identifiable {
    let id: Int?
    let name: String
    let color: String
    let title: String
    let description: String
    let link: URL
    let imageUrl: URL
}
