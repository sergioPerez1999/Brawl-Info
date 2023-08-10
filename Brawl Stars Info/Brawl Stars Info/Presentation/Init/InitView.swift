//
//  InitView.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 1/8/23.
//

import SwiftUI

struct InitView: View {
    
    @EnvironmentObject var rootViewModel: RootViewModel
    @State var animationStarted = false
    var body: some View {
        ZStack {
            Image("fondo-inicio")
                .resizable()
                .opacity(0.9)
                .ignoresSafeArea()
                .accessibilityLabel("All brawlers background photo")
            VStack (alignment: .center){
                Text("Brawl Stars Info")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                    .accessibilityLabel("Title of the app: Brawl Stars Info")
                
                Button("Get Info") {
                    rootViewModel.status = .loaded
                }
                .accessibilityAddTraits([.isButton])
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(.black)
                .background(.white)
                .cornerRadius(20)
                .shadow(radius: 25)
                .accessibilityLabel("Get Info Button")
                .accessibilityHint("Tap button to get info")
            }
            .frame(width: 300, height: 200)
            .padding(20)
            .background(.red)
            .cornerRadius(20)
            .scaleEffect(animationStarted ? 1 : 5)
            .animation(.default).onAppear{
               animationStarted = true
            }
            
            
            
        }
    }
}

struct InitView_Previews: PreviewProvider {
    static var previews: some View {
        InitView()
    }
}
