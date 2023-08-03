//
//  MapDetailView.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 3/8/23.
//

import SwiftUI

struct MapDetailView: View {
    
    let map: Map
    
    init(map: Map) {
        self.map = map
    }
    
    var body: some View {
        ScrollView {
            VStack {
                VStack (alignment: .center) {
                    Text(map.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                
                VStack (alignment: .center){
                    AsyncImage(url: map.imageUrl) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 350, height: 650)
                    } placeholder: {
                        ProgressView()
                    }
                }
                
                    Text("Game Mode: ")
                        .font(.title3)
                        .fontWeight(.bold)
                HStack {
                    Text(map.gameMode.name)
                    AsyncImage(url: map.gameMode.imageUrl) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                    } placeholder: {
                        ProgressView()
                    }
                    .padding()
                }
                
                Link("For more information...", destination: map.link)
                
            }
            
        }
        
    }
}

struct MapDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MapDetailView(map: .init(id: 15000511, name: "Devolution", link: URL(string: "https://brawlify.com/maps/detail/Devolution")!, imageUrl: URL(string: "https://cdn-old.brawlify.com/map/15000511.png")!, gameMode: .init(id: nil, name: "Bot Drop", imageUrl: URL(string: "https://cdn-old.brawlify.com/gamemode/Bot-Drop.png")!)))
    }
}
