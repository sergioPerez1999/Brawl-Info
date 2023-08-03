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
        
        ScrollView {
            VStack {
                VStack (alignment: .center) {
                    Text(brawler.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                
                VStack (alignment: .center){
                    AsyncImage(url: brawler.imageUrl) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 350, height: 350)
                            .clipShape(Circle())
                    } placeholder: {
                        ProgressView()
                    }
                }
                VStack{
                    Text("Description")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text(brawler.description)
                        .padding(EdgeInsets(top: 2, leading: 10, bottom: 2, trailing: 10))
                    HStack {
                        Text("Class: ")
                            .fontWeight(.bold)
                        Text(brawler.class.name)
                        Divider()
                            .background(.black)
                        Text("Rarity: ")
                            .fontWeight(.bold)
                        Image(brawler.rarity.name)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            
                    }
                        
                }
                VStack {
                    HStack {
                        AsyncImage(url: brawler.starPowers[0].imageUrl) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 30, height: 30)
                        } placeholder: {
                            ProgressView()
                        }
                        Text("Star Powers")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundStyle(Color(red: 1, green: 0.7, blue: 0.2))
                            
                            
                    }
                    
                    ForEach(brawler.starPowers) { power in
                        HStack (alignment: .top){
                            Text("\(power.name): ")
                                .fontWeight(.bold)
                            Spacer()
                            Text("\(power.description)")
                        }
                        .padding(EdgeInsets(top: 2, leading: 10, bottom: 2, trailing: 10))
                            
                    }
                }
                
                VStack {
                    HStack {
                        AsyncImage(url: brawler.gadgets[0].imageUrl) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 30, height: 30)
                        } placeholder: {
                            ProgressView()
                        }
                        Text("Gadgets")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundStyle(Color(red: 0, green: 0.7, blue: 0))
                    }
                    
                    ForEach(brawler.gadgets) { gadget in
                        HStack (alignment: .top){
                            Text("\(gadget.name): ")
                                .fontWeight(.bold)
                            Spacer()
                            Text("\(gadget.description)")
                        }
                        .padding(EdgeInsets(top: 2, leading: 10, bottom: 2, trailing: 10))
                            
                    }
                    
                    Link("For more information...", destination: brawler.link)
                }

            }
            
        }
        
    }
}

struct BrawlerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BrawlerDetailView(brawler:
                .init(id: 16000000,
                      name: "Shelly",
                      link: URL(string: "https://brawlify.com/brawlers/detail/Shelly")!,
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
