//
//  InitView.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 1/8/23.
//

import SwiftUI

struct InitView: View {
    
    @EnvironmentObject var rootViewModel: RootViewModel
    
    var body: some View {
        ZStack {
            Image("fondo-inicio")
                .resizable()
                .opacity(0.9)
                .ignoresSafeArea()
            VStack (alignment: .center){
                Text("Brawl Stars Info")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                
                Button("Get Info") {
                    rootViewModel.status = .loaded
                }
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(.black)
                .background(.white)
                .cornerRadius(20)
                .shadow(radius: 25)
            }
            .frame(width: 300, height: 200)
            .padding(20)
            .background(.red)
            .cornerRadius(20)
            
            
        }
    }
}

struct InitView_Previews: PreviewProvider {
    static var previews: some View {
        InitView()
    }
}
