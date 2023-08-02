//
//  BrawlerCellView.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 1/8/23.
//

import SwiftUI

struct BrawlerCellView: View {
    
    var brawler: Brawler
    
    init(brawler: Brawler) {
        self.brawler = brawler
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                AsyncImage(url: brawler.imageUrl) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        
                } placeholder: {
                    ProgressView()
                }
                
                
                VStack (alignment: .leading) {
                    
                    Text(brawler.name)
                        .fontWeight(.bold)
                        .font(.system(size: 18))
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 0))
                    Text(brawler.description)
                        .font(.system(size: 14))
                        .lineLimit(2)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 0))
                    
                    HStack  {
                        VStack (alignment: .leading){
                            Text("Class: \(brawler.class.name)")
                                .font(.system(size: 14))
                            HStack {
                                Text("Rarity: ")
                                    .font(.system(size: 14))
                                Text(brawler.rarity.name)
                                    .font(.system(size: 14))
                            }
                            
                        }
                        
                        Image(brawler.rarity.name)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                        
                    }
                    
                }
                .padding(5)

            }
        }
        
    }
}

struct BrawlerCellView_Previews: PreviewProvider {
    static var previews: some View {
        BrawlerCellView(brawler:
                .init(id: 16000000,
                      name: "Shelly",
                      imageUrl: URL(string: "https://cdn-old.brawlify.com/brawler/Shelly.png")!,
                      class: .init(name: "Damage Dealer"),
                      rarity: .init(name: "Common", color: "#b9eaff"),
                      description: "Shelly's spread-fire shotgun blasts the other team with buckshot. Her Super destroys cover and keeps her opponents at a distance!",
                      starPowers: [
                        .init(id: 23000076, name: "Shell Shock", description: "Shelly's Super shells slow down enemies for x seconds!", imageUrl: URL(string: "https://cdn-old.brawlify.com/star-powers/Full.png")!),
                        .init(id: 23000135, name: "Band-Aid", description: "When Shelly falls below x% health, she instantly heals for x health. Band-Aid recharges in x seconds.", imageUrl: URL(string: "https://cdn-old.brawlify.com/star-powers/Full.png")!)
                      ],
                      gadgets: [
                        .init(id: 23000255, name: "Fast Forward", description: "Shelly dashes ahead, skipping a few unnecessary steps!", imageUrl: URL(string: "https://cdn-old.brawlify.com/gadgets/Full.png")!)
                      ]))
    }
}
