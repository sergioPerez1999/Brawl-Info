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
                
                VStack {
                    
                    List {
                        VStack {
                            Text("Sort By")
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
                            Picker("Sort By", selection: $rootViewModel.sortOption) {
                                Text("Name").tag(SortOptionsEnum.name)
                                Text("Rarity").tag(SortOptionsEnum.rarity)
                                Text("Class").tag(SortOptionsEnum.`class`)
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .padding(EdgeInsets(top: 5, leading: 10, bottom: 10, trailing: 10))
                        }
                        .overlay(RoundedRectangle(cornerRadius: 15)
                                                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [15.0])))
                        .padding()
                        ForEach(rootViewModel.searchedBrawlers) { brawler in
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
            .searchable(text: $rootViewModel.searchText)
            
            
            
        }
    }
}
