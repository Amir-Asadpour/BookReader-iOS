//
//  BooksRepositoryImpl.swift
//  BookReader
//
//  Created by Amir Asadpour on 9/21/24.
//

import Combine
import Factory
import Foundation

class BooksRepositoryImpl: BooksRepository {
    @Injected(\.remoteAPI) private var remoteAPI
    @Injected(\.booksLocalDataSource) private var localDataSource

    func getBooks() -> AnyPublisher<[Book], Error> {
        return remoteAPI.getBooks()
            .combineLatest(localDataSource.getBooks())
            .flatMap { [weak self] remoteBooks, localBooks -> AnyPublisher<[Book], Error> in
                let favoriteBooksId = localBooks.filter { $0.isFavorite }.map { $0.id }
                
                let books = remoteBooks.map { $0.toDomain(isFavorite: favoriteBooksId.contains($0.id)) }
                
                guard let self = self else {
                    return Just(books).setFailureType(to: Error.self).eraseToAnyPublisher()
                }
                
                return self.localDataSource.saveBooks(books)
                    .map { books }
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }

    func getBook(by id: String) -> AnyPublisher<Book, Error> {
        return localDataSource.getBook(with: id)
    }

    func updateBook(_ book: Book) -> AnyPublisher<Void, Error> {
        return localDataSource.updateBook(book)
            .map { _ in Void() }
            .eraseToAnyPublisher()
    }

    func getFavoriteBooks() -> AnyPublisher<[Book], Error> {
        return localDataSource.getFavoriteBooks()
    }
}
