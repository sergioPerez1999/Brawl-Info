//
//  MapCellView.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 3/8/23.
//

import SwiftUI

struct MapCellView: View {
    
    let map: Map
    
    init(map: Map) {
        self.map = map
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(map.name)
                .font(.title2)
                .fontWeight(.bold)
            HStack {
                Text(map.gameMode.name)
                AsyncImage(url: map.gameMode.imageUrl) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                } placeholder: {
                    ProgressView()
                }
                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 0))

            }
            
            
        }
    }
    
    struct MapCellView_Previews: PreviewProvider {
        static var previews: some View {
            MapCellView(map: .init(id: 15000511, name: "Devolution", link: URL(string: "https://brawlify.com/maps/detail/Devolution")!, imageUrl: URL(string: "https://cdn-old.brawlify.com/map/15000511.png")!, gameMode: .init(id: nil, name: "Bot Drop", imageUrl: URL(string: "https://cdn-old.brawlify.com/gamemode/Bot-Drop.png")!)))
        }
    }
}
