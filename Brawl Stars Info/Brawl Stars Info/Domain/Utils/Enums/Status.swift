//
//  Status.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 9/8/23.
//

import Foundation


enum Status: Equatable {
    case primary, loaded, error(error: String)
}
