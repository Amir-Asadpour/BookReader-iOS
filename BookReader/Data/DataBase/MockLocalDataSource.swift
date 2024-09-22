
//
//  MockLocalDataSource.swift
//  BookReader
//
//  Created by Amir Asadpour on 9/22/24.
//

import Foundation
import Combine

class MockBooksLocalDataSource: BooksLocalDataSource {
    private var books: [Book] = [] {
        didSet {
            print(books)
        }
    }

    func getBooks() -> AnyPublisher<[Book], any Error> {
        return Just(books)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func saveBooks(_ books: [Book]) -> AnyPublisher<Void, any Error> {
        self.books = books
        return Just(())
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func updateBook(_ book: Book) -> AnyPublisher<Book, any Error> {
        let index = books.firstIndex(where: { $0.id == book.id })!
        books[index] = book
        return Just(book)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func getBook(with id: String) -> AnyPublisher<Book, any Error> {
        let book = books.first(where: { $0.id == id })!
        return Just(book)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func getFavoriteBooks() -> AnyPublisher<[Book], any Error> {
        let favoriteBooks = books.filter { $0.isFavorite }
        return Just(favoriteBooks)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
