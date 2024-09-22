//
//  Untitled.swift
//  BookReader
//
//  Created by Amir Asadpour on 9/21/24.
//

import SwiftUI
import Kingfisher

struct BooksListView: View {
    let books: [Book]
    let onBookTapped: (Book) -> Void
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(books, id: \.id) { book in
                    BookItemView(
                        book: book,
                        onBookTapped: { onBookTapped(book) }
                    )
                    .padding(.horizontal)
                }
            }
            .padding(.vertical)
        }
    }
}

#Preview {
    BooksListView(books: Mock.books) { _ in }
}
