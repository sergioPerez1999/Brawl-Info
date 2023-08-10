//
//  HomeView.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 1/8/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var homeViewModel: HomeViewModel
    
    

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
                            Picker("Sort By", selection: $homeViewModel.sortOption) {
                                Text("Name").tag(SortOptionsEnum.name)
                                Text("Rarity").tag(SortOptionsEnum.rarity)
                                Text("Class").tag(SortOptionsEnum.`class`)
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .padding(EdgeInsets(top: 5, leading: 10, bottom: 10, trailing: 10))
                            .accessibilityLabel("Picker with three options to sort by")
                            .accessibilityHint("Three positions of a picker: Name, Rarity, Class in order.")
                            
                        }
                        .overlay(RoundedRectangle(cornerRadius: 15)
                                                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [15.0])))
                        .padding()
                        ForEach(homeViewModel.searchedBrawlers) { brawler in
                            NavigationLink {
                                BrawlerDetailView(brawler: brawler)
                            } label: {
                                BrawlerCellView(brawler: brawler)
                                    .accessibilityLabel("Brawler Cell")
                                    .accessibilityHint("Press the cell to navigate to a brawler detail view")
                            }
                            
                        }
                        
                        
                    }
                    
                    .scrollContentBackground(.hidden)
                    .navigationTitle("Brawlers")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        
                        ToolbarItem(placement: .navigationBarLeading) {
                            ExitButtonView()
                        }
                        
                    }
                }
                
                
            }
            .searchable(text: $homeViewModel.searchText)
            
            
            
            
        }
    }
}
