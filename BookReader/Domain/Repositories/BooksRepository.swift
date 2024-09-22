//
//  BooksRepository.swift
//  BookReader
//
//  Created by Amir Asadpour on 9/21/24.
//

import Combine

protocol BooksRepository {
    func getBooks() -> AnyPublisher<[Book], Error>
    
    func getBook(by id: String) -> AnyPublisher<Book, Error>
    
    func updateBook(_ book: Book) -> AnyPublisher<Void, Error>
    
    func getFavoriteBooks() -> AnyPublisher<[Book], Error>
}
