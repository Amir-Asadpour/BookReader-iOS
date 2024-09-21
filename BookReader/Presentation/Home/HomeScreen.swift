//
//  HomeView.swift
//  BookReader
//
//  Created by Amir Asadpour on 9/21/24.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                switch viewModel.screenState {
                case .loading:
                    ProgressView()
                case .loaded(let books):
                    BooksListView(books: books)
                case .error(_):
                    TryAgainView {
                        viewModel.getBooks()
                    }
                }
            }
            .navigationTitle("all_books")
            .onAppear {
                viewModel.getBooks()
            }
        }
    }
}

#Preview {
    HomeScreen()
}
