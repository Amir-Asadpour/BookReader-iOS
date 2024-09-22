//
//  HomeView.swift
//  BookReader
//
//  Created by Amir Asadpour on 9/21/24.
//

import SwiftUI

struct HomeScreen: View {
    @FocusState private var searchIsFocused: Bool
    
    @StateObject var viewModel = HomeViewModel()
    
    @Binding var navigationPath: NavigationPath
    
    var body: some View {
        NavigationView {
            ZStack {
                switch viewModel.screenState {
                case .loading:
                    ProgressView()
                case .loaded(let books):
                    VStack {
                        TextField("search_hint", text: $viewModel.query)
                            .padding(.vertical, 8)
                            .padding(.horizontal)
                            .focused($searchIsFocused)
                        
                        BooksListView(books: books) { book in
                            navigationPath.append(book.id)
                        }
                        .animation(.spring, value: books)
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
        .onTapGesture {
            searchIsFocused = false
        }
    }
}

#Preview {
    HomeScreen(
        navigationPath: .constant(NavigationPath())
    )
}
