//
//  URLSessionExtension.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 4/8/23.
//

import Foundation

extension URLSession: NetworkFetchingProtocol {
    
    func data(url: URLRequest) async throws  -> (Data, URLResponse) {
        return try await data(for: url)
    }
}
