//
//  HomeView.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 1/8/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    @ObservedObject var homeViewModel: HomeViewModel
    
    init(homeViewModel: HomeViewModel) {
        self.homeViewModel = homeViewModel
    }
    var body: some View {
        VStack {
            Button("Salir") {
                rootViewModel.goToHome()
            }
            NavigationStack {
                List {
                    ForEach(homeViewModel.brawlers) { brawler in
                        NavigationLink {
                            BrawlerDetailView(brawler: brawler)
                        } label: {
                            BrawlerCellView(brawler: brawler)
                        }
                    }
                }
                .navigationTitle("Brawlers")
                .navigationBarTitleDisplayMode(.inline)

            }
            
        }
    }
}

