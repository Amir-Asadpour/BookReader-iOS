//
//  HomeView.swift
//  BookReader
//
//  Created by Amir Asadpour on 9/21/24.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var viewModel = HomeViewModel()
    
    @Binding var navigationPath: NavigationPath
    
    var body: some View {
        NavigationView {
            ZStack {
                switch viewModel.screenState {
                case .loading:
                    ProgressView()
                case .loaded(let books):
                    BooksListView(books: books) { book in
                        navigationPath.append(book.id)
                    }
                case .error(_):
                    TryAgainView {
                        viewModel.getBooks()
                    }
                }
            }
            .navigationTitle("all_books")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                viewModel.getBooks()
            }
        }
    }
}

#Preview {
    HomeScreen(
        navigationPath: .constant(NavigationPath())
    )
}
