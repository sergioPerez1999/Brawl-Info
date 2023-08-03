//
//  GameCellView.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 3/8/23.
//

import SwiftUI

struct GameCellView: View {
    
    let game: Game
    
    init(game: Game) {
        self.game = game
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                AsyncImage(url: game.imageUrl) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                } placeholder: {
                    ProgressView()
                }
                
                VStack (alignment: .leading){
                    Text(game.name)
                        .font(.title2)
                        .fontWeight(.bold)
                    Text(game.title)
                    Text(game.description)
                        .lineLimit(2)
                }
                .padding()

            }
        }
    }
}

struct GameCellView_Previews: PreviewProvider {
    static var previews: some View {
        GameCellView(game: .init(id: nil, name: "Bot Drop", color: "#ff4343", title: "3 vs 3", description: "Defend against the robot invasion. Destroy robots and collect bolts. First team to collect <MAX_SCORE> bolts wins the match!", link: URL(string: "https://brawlify.com/gamemodes/detail/Bot-Drop")!, imageUrl: URL(string: "https://cdn-old.brawlify.com/gamemode/Bot-Drop.png")!))
    }
}
