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
                            }
                        }
                        .padding(EdgeInsets(top: 5, leading: 10, bottom: 10, trailing: 10))
                        .pickerStyle(NavigationLinkPickerStyle())
                        
                        VStack (alignment: .center, spacing: 25) {
                            Text("Team 1")
                            HStack (spacing: 25) {
                                VStack {
                                    Text("Brawler 1")
                                    Picker("Team 1", selection: $battleViewModel.brawler_1_1) {
                                        ForEach(battleViewModel.brawlers) { brawler in
                                                Text(brawler.name)
                                        }
                                    }
                                    .labelsHidden()
                                }
                                VStack {
                                    Text("Brawler 2")
                                    Picker("Team 1", selection: $battleViewModel.brawler_1_2) {
                                        ForEach(battleViewModel.brawlers) { brawler in
                                                Text(brawler.name)
                                        }
                                    }
                                    .labelsHidden()
                                }
                                if isShown {
                                    VStack {
                                        Text("Brawler 3")
                                        Picker("Team 1", selection: $battleViewModel.brawler_1_3) {
                                            ForEach(battleViewModel.brawlers) { brawler in
                                                    Text(brawler.name)
                                            }
                                        }
                                        .labelsHidden()
                                        
                                    }
                                }
                                
                                
                            }
                        }
                        
                        VStack (alignment: .center, spacing: 25) {
                            Text("Team 2")
                            HStack (spacing: 25) {
                                VStack {
                                    Text("Brawler 1")
                                    Picker("Team 1", selection: $battleViewModel.brawler_2_1) {
                                        ForEach(battleViewModel.brawlers) { brawler in
                                                Text(brawler.name)
                                        }
                                    }
                                    .labelsHidden()
                                }
                                VStack {
                                    Text("Brawler 2")
                                    Picker("Team 1", selection: $battleViewModel.brawler_2_2) {
                                        ForEach(battleViewModel.brawlers) { brawler in
                                                Text(brawler.name)
                                        }
                                    }
                                    .labelsHidden()
                                }
                                if isShown {
                                    VStack {
                                        Text("Brawler 3")
                                        Picker("Team 1", selection: $battleViewModel.brawler_2_3) {
                                            ForEach(battleViewModel.brawlers) { brawler in
                                                    Text(brawler.name)
                                            }
                                        }
                                        .labelsHidden()
                                        
                                    }
                                }
                                
                                
                            }
                        }
                        
                    } header: {
                        Text("Battle configurations")
                    }

                }
                .navigationTitle("Battle")
                .navigationBarTitleDisplayMode(.inline)
                
                Button("Start Fight") {
                    print("Fight Started...")
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
