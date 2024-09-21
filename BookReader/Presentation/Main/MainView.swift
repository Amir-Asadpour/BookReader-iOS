//
//  MainView.swift
//  BookReader
//
//  Created by Amir Asadpour on 9/21/24.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        NavigationStack {
            TabView {
                HomeScreen()
                    .tabItem {
                        Label("home", systemImage: "house")
                    }
                
                Text("Favorites")
                    .tabItem {
                        Label("Favorites", systemImage: "star")
                    }
            }
        }
    }
}

#Preview {
    MainView()
}
