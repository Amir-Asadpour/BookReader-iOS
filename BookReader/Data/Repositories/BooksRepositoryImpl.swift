//
//  BooksRepositoryImpl.swift
//  BookReader
//
//  Created by Amir Asadpour on 9/21/24.
//

import Combine
import Foundation
import Factory

class BooksRepositoryImpl: BooksRepository {
    @Injected(\.remoteAPI) private var remoteAPI
    
    func getBooks() -> AnyPublisher<[Book], Error> {
        return remoteAPI.getBooks()
            .map { $0.map { $0.toDomain(isFavorite: false) } }
            .eraseToAnyPublisher()
    }

    func searchBooks(query: String) -> AnyPublisher<[Book], Error> {
        return Just([]).setFailureType(to: Error.self).eraseToAnyPublisher()
    }

    func getBook(by id: String) -> AnyPublisher<Book, Error> {
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

    func updateBook(_ book: Book) -> AnyPublisher<Void, Error> {
        return Just(Void()).setFailureType(to: Error.self).eraseToAnyPublisher()
    }

    func getFavoriteBooks() -> AnyPublisher<[Book], Error> {
        return Just([]).setFailureType(to: Error.self).eraseToAnyPublisher()
    }
}
