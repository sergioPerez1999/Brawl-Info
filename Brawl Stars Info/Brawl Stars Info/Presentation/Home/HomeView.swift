//
//  HomeView.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 1/8/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    

    var body: some View {
        VStack {
            
            NavigationStack {
                List {
                    ForEach(rootViewModel.brawlers) { brawler in
                        NavigationLink {
                            BrawlerDetailView(brawler: brawler)
                        } label: {
                            BrawlerCellView(brawler: brawler)
                        }

                    }
                    
                    
                }
                
                .scrollContentBackground(.hidden)
                .navigationTitle("Brawlers")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    Button("Salir") {
                        rootViewModel.goToHome()
                    }
                }

            }
            
        }
    }
}
