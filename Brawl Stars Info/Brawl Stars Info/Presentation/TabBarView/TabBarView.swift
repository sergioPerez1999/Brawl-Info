//
//  TabBarView.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 2/8/23.
//

import SwiftUI

struct TabBarView: View {
    let repository: RepositoryProtocol = RepositoryImpl(remoteDataSource: RemoteDataSourceImpl())
    

    var body: some View {
        VStack {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Brawlers", systemImage: "person.fill")
                        
                    }
                
                MapView()
                    .tabItem {
                        Label("Maps", systemImage: "map.fill")
                        
                    }
                GameView()
                    .tabItem {
                        Label("Games", systemImage: "gamecontroller.fill")
                    }
                
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gearshape.fill")
                    }
                
            }
        }
    }
}

