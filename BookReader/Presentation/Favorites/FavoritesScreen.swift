//
//  FavoritesScreen.swift
//  BookReader
//
//  Created by Amir Asadpour on 9/22/24.
//
import SwiftUI

struct FavoritesScreen: View {
        
    @StateObject private var viewModel = FavoritesViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                switch viewModel.screenState {
                case .loading:
                    ProgressView()
                case .loaded(let books):
                    if books.isEmpty {
                        Text("msg_empty_fav_books")
                            .font(.body)
                            .padding(.horizontal)
                    } else {
                        BooksListView(books: books)
                    }
                case .error(_):
                    TryAgainView {
                        viewModel.getBooks()
                    }
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            viewModel.getBooks()
        }
    }
}

#Preview {
    FavoritesScreen()
}
