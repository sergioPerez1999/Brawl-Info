//
//  Brawler.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 1/8/23.
//

import Foundation


struct Brawler: Decodable, Identifiable {
    let id: Int
    let name: String
    let imageUrl: URL
    let `class`: Clase
    let rarity: Rarity
    let description: String
    let starPowers: [StarPower]
    let gadgets: [Gadget]
}
