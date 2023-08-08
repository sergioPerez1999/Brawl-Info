//
//  MapView.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 3/8/23.
//

import SwiftUI

struct MapView: View {
    
    @EnvironmentObject var rootViewModel: RootViewModel
    @ObservedObject var mapViewModel: MapViewModel
    
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
                            Picker("Sort By", selection: $mapViewModel.sortOptionMap) {
                                Text("Name").tag(SortOptionsEnumMap.name)
                                Text("Game").tag(SortOptionsEnumMap.game)
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .padding(EdgeInsets(top: 5, leading: 10, bottom: 10, trailing: 10))
                            
                        }
                        .overlay(RoundedRectangle(cornerRadius: 15)
                                                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [15.0])))
                        .padding()
                        
                        ForEach(mapViewModel.searchedMaps) { map in
                            NavigationLink {
                                MapDetailView(map: map)
                            } label: {
                                MapCellView(map: map)
                            }
                            
                        }
                        
                        
                    }
                    
                    .scrollContentBackground(.hidden)
                    .navigationTitle("Maps")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        Button("Exit") {
                            rootViewModel.goToHome()
                        }
                    }
                }
                
                
            }
            .searchable(text: $mapViewModel.searchTextMap)
            
            
            
        }
    }
}


