//
//  BooksLocalDataSource.swift
//  BookReader
//
//  Created by Amir Asadpour on 9/22/24.
//

import Foundation
import Combine

protocol BooksLocalDataSource {
    func getBooks() -> AnyPublisher<[Book], Error>
    
    func saveBooks(_ books: [Book]) -> AnyPublisher<Void, Error>
    
    func updateBook(_ book: Book) -> AnyPublisher<Book, Error>
    
    func getBook(with id: String) -> AnyPublisher<Book, Error>
    
    func getFavoriteBooks() -> AnyPublisher<[Book], Error>
}
