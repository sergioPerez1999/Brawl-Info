//
//  RootView.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 1/8/23.
//

import SwiftUI

struct RootView: View {
    
    @EnvironmentObject var rootViewModel: RootViewModel
    var body: some View {
        switch (rootViewModel.status) {
            
        case .primary:
            InitView()
        
        case .loading:
            ProgressView()
        
        case .error(error: let errorString):
            Text("Error \(errorString)")
            
        case .loaded:
            TabBarView()
        }
        
    }
}
