//
//  RootView.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 1/8/23.
//

import SwiftUI

struct RootView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @EnvironmentObject var rootViewModel: RootViewModel
    var body: some View {
        switch (rootViewModel.status) {
            
        case .primary:
            InitView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
        
        case .error(error: let errorString):
            Text("Error \(errorString)")
            
        case .loaded:
            TabBarView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
        
    }
}
