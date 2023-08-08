//
//  GameDetailView.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 3/8/23.
//

import SwiftUI

struct GameDetailView: View {
    
    let game: Game
    
    init(game: Game) {
        self.game = game
    }
    
    var body: some View {
        ScrollView {
            VStack {
                VStack (alignment: .center) {
                    Text(game.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(Color(hex: game.color))
                    Text(game.title)
                        .font(.title2)
                        .fontWeight(.bold)
                }
                
                VStack (alignment: .center){
                    AsyncImage(url: game.imageUrl) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 320, height: 400)
                    } placeholder: {
                        ProgressView()
                    }
                }
                
                    Text("Description: ")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding()
                    Text(game.description)
                    .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                
                Link("For more information...", destination: game.link)
                    .padding()
                
            }
            
            
        }
        
        
        
    }
}

struct GameDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GameDetailView(game: .init(id: nil, name: "Bot Drop", color: "#ff4343", title: "3 vs 3", description: "Defend against the robot invasion. Destroy robots and collect bolts. First team to collect <MAX_SCORE> bolts wins the match!", link: URL(string: "https://brawlify.com/gamemodes/detail/Bot-Drop")!, imageUrl: URL(string: "https://cdn-old.brawlify.com/gamemode/Bot-Drop.png")!))
    }
}
