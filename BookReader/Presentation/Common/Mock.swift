//
//  Mock.swift
//  BookReader
//
//  Created by Amir Asadpour on 9/21/24.
//

import Foundation

struct Mock {
    static var bookImageURL: URL = URL(string: "https://m.media-amazon.com/images/I/81aY1lxk+9L._AC_UF1000,1000_QL80_.jpg")!
    
    static var books: [Book] = [
        Book(
            id: "1",
            title: "Book 1",
            author: "Author 1",
            description: "Description 1",
            isFavorite: false,
            image: bookImageURL
        ),
        Book(
            id: "2",
            title: "Book 2",
            author: "Author 2",
            description: "Description 2",
            isFavorite: false,
            image: bookImageURL
        ),
        Book(
            id: "3",
            title: "Book 3",
            author: "Author 3",
            description: "Description 3",
            isFavorite: false,
            image: bookImageURL
        )
    ]
}
