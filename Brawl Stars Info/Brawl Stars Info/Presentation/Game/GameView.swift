//
//  GameView.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 3/8/23.
//

import SwiftUI

struct GameView: View {
    
    @ObservedObject var gameViewModel: GameViewModel
    var body: some View {
        VStack {
            
            NavigationStack {
                
                VStack {
                    
                    List {
                        ForEach(gameViewModel.searchedGames) { game in
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
                        ToolbarItem(placement: .navigationBarLeading) {
                            ExitButtonView()
                        }
                    }
                }
                
                
            }
            .searchable(text: $gameViewModel.searchTextGame)
            
            
            
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(gameViewModel: GameViewModel(repository: RepositoryImpl(remoteDataSource: RemoteDataSourceImpl())))
    }
}
