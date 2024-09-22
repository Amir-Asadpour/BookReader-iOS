//
//  BookItemView.swift
//  BookReader
//
//  Created by Amir Asadpour on 9/21/24.
//
import SwiftUI
import Kingfisher

struct BookItemView: View {
    let book: Book
    let onBookTapped: () -> Void
    
    var body: some View {
        HStack(spacing: 24) {
            KFImage(book.image)
                .resizable()
                .aspectRatio(2.2/3, contentMode: .fill)
                .frame(width: 110)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .shadow(radius: 4)
            
            VStack(alignment: .leading, spacing: 24) {
                Text(book.title)
                    .font(.headline)
                
                Text(book.author)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .contentShape(Rectangle())
        .onTapGesture {
            onBookTapped()
        }
    }
}

#Preview {
    BookItemView(book: Mock.books[0]) { }
}
