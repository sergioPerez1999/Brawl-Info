//
//  NetworkFetchingProtocol.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 3/8/23.
//

import Foundation
import Combine


protocol NetworkFetchingProtocol {
    
    func data(url: URLRequest) async throws  -> (Data, URLResponse)
    
}
