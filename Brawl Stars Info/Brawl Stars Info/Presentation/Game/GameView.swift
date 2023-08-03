//
//  GameView.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 3/8/23.
//

import SwiftUI

struct GameView: View {
    
    @EnvironmentObject var rootViewModel: RootViewModel
    
    var body: some View {
        VStack {
            
            NavigationStack {
                
                VStack {
                    
                    List {
                        ForEach(rootViewModel.searchedGames) { game in
                            NavigationLink {
                                GameDetailView(game: game)
                            } label: {
                                GameCellView(game: game)
                            }
                            
                        }
                        
                        
                    }
                    .scrollContentBackground(.hidden)
                    .navigationTitle("Games")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        Button("Exit") {
                            rootViewModel.goToHome()
                        }
                    }
                }
                
                
            }
            .searchable(text: $rootViewModel.searchTextGame)
            
            
            
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
