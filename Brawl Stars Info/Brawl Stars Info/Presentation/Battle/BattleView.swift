//
//  BattleView.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 4/8/23.
//

import SwiftUI

struct BattleView: View {
    @ObservedObject var battleViewModel: BattleViewModel
    @State var isShown = true
    
    init(battleViewModel: BattleViewModel) {
        self.battleViewModel = battleViewModel
    }
    
    var body: some View {
        VStack {
            
            NavigationStack {
                Form {
                    Section {
                        Picker("Map", selection: $battleViewModel.mapSelected) {
                            ForEach(battleViewModel.maps) { map in
                                HStack {
                                    Text(map.name)
                                    AsyncImage(url: map.gameMode.imageUrl) { image in
                                        image.resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 40, height: 40, alignment: .center)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 10))

                                    
                                }
                                .tag(map.id)
                            }
                        }
    
                        .padding(EdgeInsets(top: 5, leading: 10, bottom: 10, trailing: 10))
                        .pickerStyle(NavigationLinkPickerStyle())
                        
                        Picker("Brawler", selection: $battleViewModel.brawlerSelected) {
                            ForEach(battleViewModel.brawlers) { brawler in
                                HStack {
                                    Text(brawler.name)
                                    AsyncImage(url: brawler.imageUrl) { image in
                                        image.resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 35, height: 35, alignment: .center)
                                            .clipShape(Circle())
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 10))

                                    
                                }
                                .tag(brawler.id)
                            }
                        }
                        .padding(EdgeInsets(top: 5, leading: 10, bottom: 10, trailing: 10))
                        .pickerStyle(NavigationLinkPickerStyle())
                        Button("Start Fight") {
                            battleViewModel.startBattle()
                        }
                        
                    } header: {
                        Text("Battle configurations")
                    }

                }
                .navigationTitle("Battle")
                .navigationBarTitleDisplayMode(.inline)
                .alert(isPresented: $battleViewModel.isAlertPresented) {
                    Alert(title: Text("Battle results"), message: Text(battleViewModel.alertMessage), dismissButton: .default(Text("Close")))
                        }

                
                
            }
            
        }
        
    }
}


struct BattleView_Previews: PreviewProvider {
    static var previews: some View {
        BattleView(battleViewModel: BattleViewModel(repository: RepositoryImpl(remoteDataSource: RemoteDataSourceImpl())))
    }
}
