//
//  Gadget.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 1/8/23.
//

import Foundation


struct Gadget: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let imageUrl: URL
    
}
