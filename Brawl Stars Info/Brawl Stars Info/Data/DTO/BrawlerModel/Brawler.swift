//
//  Brawler.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 1/8/23.
//

import Foundation


struct Brawler: Codable, Identifiable {
    let id: Int
    let name: String
    let link: URL
    let imageUrl: URL
    let `class`: Clase
    let rarity: Rarity
    let description: String
    let starPowers: [StarPower]
    let gadgets: [Gadget]
}
