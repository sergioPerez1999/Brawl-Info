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
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gearshape.fill")
                    }
                
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
