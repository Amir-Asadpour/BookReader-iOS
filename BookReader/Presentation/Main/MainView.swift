//
//  MainView.swift
//  BookReader
//
//  Created by Amir Asadpour on 9/21/24.
//

import SwiftUI

struct MainView: View {
    
    @State private var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            TabView {
                HomeScreen(navigationPath: $navigationPath)
                    .tabItem {
                        Label("home", systemImage: "house")
                    }
                
                FavoritesScreen(navigationPath: $navigationPath)
                    .tabItem {
                        Label("favorites", systemImage: "star")
                    }
            }
            .navigationDestination(for: String.self) { bookId in
                BookDetailScreen(bookId: bookId)
            }
        }
    }
}

#Preview {
    MainView()
}
