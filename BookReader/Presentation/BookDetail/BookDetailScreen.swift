//
//  BookDetailScreen.swift
//  BookReader
//
//  Created by Amir Asadpour on 9/22/24.
//

import SwiftUI

struct BookDetailScreen: View {
    let bookId: String
    
    @StateObject private var viewModel = BookDetailViewModel()
    
    var body: some View {
        ZStack {
            switch viewModel.screenState {
            case .error(_):
                TryAgainView { viewModel.getBookDetail(bookId: bookId) }
            case .loading:
                ProgressView()
            case .loaded(let book):
                ScrollView {
                    BookDetailView(book: book) {
                        viewModel.onFavoriteButtonTapped(
                            book: book
                        )
                    }
                }
            }
        }
        .navigationTitle("book_detail")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.getBookDetail(bookId: bookId)
        }
    }
}

#Preview {
    BookDetailScreen(bookId: "1")
}
