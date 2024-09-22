//
//  FavoritesScreen.swift
//  BookReader
//
//  Created by Amir Asadpour on 9/22/24.
//
import SwiftUI

struct FavoritesScreen: View {
        
    @StateObject private var viewModel = FavoritesViewModel()
    
    @Binding var navigationPath: NavigationPath
    
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
                        BooksListView(books: books) { book in
                            navigationPath.append(book.id)
                        }
                    }
                case .error(_):
                    TryAgainView {
                        viewModel.getBooks()
                    }
                }
            }
            .navigationTitle("fav_books")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            viewModel.getBooks()
        }
    }
}

#Preview {
    FavoritesScreen(navigationPath: .constant(NavigationPath()))
}
