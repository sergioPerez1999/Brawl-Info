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
                .opacity(0.8)
                .ignoresSafeArea()
            VStack {
                Text("Brawl Stars Info")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                
                Button("Get Info") {
                    rootViewModel.getBrawlers()
                }
            }
            .padding(20)
            .background(.red)
            
        }
    }
}

struct InitView_Previews: PreviewProvider {
    static var previews: some View {
        InitView()
    }
}
