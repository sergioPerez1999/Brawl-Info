//
//  BrawlerDetailView.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 1/8/23.
//

import SwiftUI

struct BrawlerDetailView: View {
    let brawler: Brawler
    
    var body: some View {
        Text(brawler.name)
    }
}

struct BrawlerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BrawlerDetailView(brawler:
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
