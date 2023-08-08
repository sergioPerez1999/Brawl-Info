//
//  Brawl_Stars_InfoApp.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 1/8/23.
//

import SwiftUI

@main
struct Brawl_Stars_InfoApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(RootViewModel())
                
        }
    }
}
