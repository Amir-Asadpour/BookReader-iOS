//
//  BooksRepositoryImpl.swift
//  BookReader
//
//  Created by Amir Asadpour on 9/21/24.
//

import Combine
import Foundation

class BooksRepositoryImpl: BooksRepository {
    func getBooks() -> AnyPublisher<[Book], any Error> {
        return Just([]).setFailureType(to: Error.self).eraseToAnyPublisher()
    }

    func searchBooks(query: String) -> AnyPublisher<[Book], any Error> {
        return Just([]).setFailureType(to: Error.self).eraseToAnyPublisher()
    }

    func getBook(by id: String) -> AnyPublisher<Book, any Error> {
        return Just(
            Book(
                id: "",
                title: "",
                author: "",
                description: "",
                isFavorite: false,
                image: URL(string: "")!
            )
        ).setFailureType(to: Error.self).eraseToAnyPublisher()
    }

    func updateBook(_ book: Book) -> AnyPublisher<Void, any Error> {
        return Just(Void()).setFailureType(to: Error.self).eraseToAnyPublisher()
    }

    func getFavoriteBooks() -> AnyPublisher<[Book], any Error> {
        return Just([]).setFailureType(to: Error.self).eraseToAnyPublisher()
    }
}
