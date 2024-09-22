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
                        
                        if books.isEmpty {
                            Text("no_books_found")
                                .font(.body)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        } else {
                            BooksListView(books: books) { book in
                                navigationPath.append(book.id)
                            }
                        }
                    }
                    .animation(.spring, value: books)
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
        .overlay {
            if searchIsFocused {
                ZStack { }
                    .ignoresSafeArea()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.01))
                    .onTapGesture {
                        searchIsFocused = false
                    }
            }
        }
    }
}

#Preview {
    HomeScreen(
        navigationPath: .constant(NavigationPath())
    )
}
