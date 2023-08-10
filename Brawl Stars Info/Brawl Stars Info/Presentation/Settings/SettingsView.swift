//
//  SettingsView.swift
//  Brawl Stars Info
//
//  Created by Pérez Cubedo Sergio on 2/8/23.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        NavigationStack {
            List{
                HStack{
                    Toggle("Dark Mode", isOn: $isDarkMode)
                        .tint(.red)
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    ExitButtonView()
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
