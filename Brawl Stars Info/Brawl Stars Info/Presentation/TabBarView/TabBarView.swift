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
                HomeView(homeViewModel: HomeViewModel(repository: RepositoryImpl(remoteDataSource: RemoteDataSourceImpl())))
                    .tabItem {
                        Label("Brawlers", systemImage: "person.fill")
                        
                    }
                
                MapView(mapViewModel: MapViewModel(repository: RepositoryImpl(remoteDataSource: RemoteDataSourceImpl())))
                    .tabItem {
                        Label("Maps", systemImage: "map.fill")
                        
                    }
                GameView(gameViewModel: GameViewModel(repository: RepositoryImpl(remoteDataSource: RemoteDataSourceImpl())))
                    .tabItem {
                        Label("Games", systemImage: "gamecontroller.fill")
                    }
                BattleView(battleViewModel: BattleViewModel(repository: RepositoryImpl(remoteDataSource: RemoteDataSourceImpl())))
                    .tabItem {
                        Label("Battle", systemImage: "arrowshape.turn.up.left.fill")
                    }
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gearshape.fill")
                    }
                
            }
            .accessibilityLabel("Tab Bar")
            .accessibilityHint("Tab bar with 5 positions: Brawlers, Maps, Games, Battle and Settings, in order.")
        }
    }
}

