//
//  BookDetailView.swift
//  BookReader
//
//  Created by Amir Asadpour on 9/22/24.
//

import SwiftUI
import Kingfisher

struct BookDetailView: View {
    let book: Book
    let onFavTapped: () -> Void
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                KFImage(book.image)
                    .resizable()
                    .aspectRatio(2.1/3, contentMode: .fill)
                    .frame(width: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .shadow(radius: 12)
                    .padding()
                
                Button(action: onFavTapped) {
                    Text(book.isFavorite ? "remove_from_fav" : "add_to_favorites")
                    Image(
                        systemName: book.isFavorite ? "heart.fill" : "heart"
                    )
                }                
                .font(.headline)
                .padding(.top, 16)
                
                
                Text(book.title)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 32)
                    .font(.headline)
                
                Text(book.author)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 12)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(book.description)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.top, 24)
            }
            .padding()
        }
    }
}

#Preview {
    BookDetailView(
        book: Book(
            id: "1",
            title: "iOS Development",
            author: "Amir Asadpour",
            description: "Description",
            isFavorite: false,
            image: URL(string: "https://m.media-amazon.com/images/I/81aY1lxk+9L._AC_UF1000,1000_QL80_.jpg")!
        ),
        onFavTapped: { }
    )
}
