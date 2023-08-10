//
//  ExitButtonView.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 10/8/23.
//

import SwiftUI

struct ExitButtonView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    @State var animationStarted = false
    var body: some View {
        
        Button {
            rootViewModel.goToHome()
        } label: {
            Image(systemName: "chevron.backward")
                .resizable()
                .foregroundColor(.red)
        }
        
        
    }
}

struct ExitButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ExitButtonView()
    }
}
