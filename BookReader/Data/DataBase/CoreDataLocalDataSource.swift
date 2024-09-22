//
//  CoreDataLocalDataSource.swift
//  BookReader
//
//  Created by Amir Asadpour on 9/22/24.
//

import Combine
import CoreData
import Factory

class CoreDataBooksLocalDataSource: BooksLocalDataSource {
    @Injected(\.coreDataController) private var coreDataController: CoreDataController
        
    func getBooks() -> AnyPublisher<[Book], Error> {
        let context = coreDataController.container.viewContext
        let request: NSFetchRequest<CoreDataBook> = CoreDataBook.fetchRequest()
        
        return Future { promise in
            context.perform {
                do {
                    let coreDataBooks = try context.fetch(request)
                    let books = coreDataBooks.map { $0.toDomain() }
                    promise(.success(books))
                } catch {
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
        
    func saveBooks(_ books: [Book]) -> AnyPublisher<Void, Error> {
        let context = coreDataController.container.newBackgroundContext()
        
        return Future { promise in
            context.perform {
                do {
                    for book in books {
                        let request: NSFetchRequest<CoreDataBook> = CoreDataBook.fetchRequest()
                        request.predicate = NSPredicate(format: "id == %@", book.id)
                        request.fetchLimit = 1
                        
                        let coreDataBook: CoreDataBook
                        if let existingBook = try context.fetch(request).first {
                            coreDataBook = existingBook
                        } else {
                            coreDataBook = CoreDataBook(context: context)
                        }
                        
                        coreDataBook.id = book.id
                        coreDataBook.title = book.title
                        coreDataBook.author = book.author
                        coreDataBook.bookDescription = book.description
                        coreDataBook.isFavorite = book.isFavorite
                        coreDataBook.image = book.image.absoluteString
                    }
                    
                    try context.save()
                    promise(.success(()))
                } catch {
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    func updateBook(_ book: Book) -> AnyPublisher<Book, Error> {
        let context = coreDataController.container.viewContext
        
        return Future { promise in
            context.perform {
                do {
                    let request: NSFetchRequest<CoreDataBook> = CoreDataBook.fetchRequest()
                    request.predicate = NSPredicate(format: "id == %@", book.id)
                    request.fetchLimit = 1
                    
                    if let coreDataBook = try context.fetch(request).first {
                        coreDataBook.title = book.title
                        coreDataBook.author = book.author
                        coreDataBook.bookDescription = book.description
                        coreDataBook.isFavorite = book.isFavorite
                        coreDataBook.image = book.image.absoluteString
                        
                        try context.save()
                        promise(.success(book))
                    } else {
                        promise(.failure(NSError(domain: "CoreDataBooksLocalDataSource", code: 404, userInfo: [NSLocalizedDescriptionKey: "Book not found"])))
                    }
                } catch {
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
        
    func getBook(with id: String) -> AnyPublisher<Book, Error> {
        let context = coreDataController.container.viewContext
        let request: NSFetchRequest<CoreDataBook> = CoreDataBook.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", id)
        request.fetchLimit = 1
        
        return Future { promise in
            context.perform {
                do {
                    if let coreDataBook = try context.fetch(request).first {
                        let book = coreDataBook.toDomain()
                        promise(.success(book))
                    } else {
                        promise(.failure(NSError(domain: "CoreDataBooksLocalDataSource", code: 404, userInfo: [NSLocalizedDescriptionKey: "Book not found"])))
                    }
                } catch {
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    func getFavoriteBooks() -> AnyPublisher<[Book], Error> {
        let context = coreDataController.container.viewContext
        let request: NSFetchRequest<CoreDataBook> = CoreDataBook.fetchRequest()
        request.predicate = NSPredicate(format: "isFavorite == YES")
        
        return Future { promise in
            context.perform {
                do {
                    let coreDataBooks = try context.fetch(request)
                    let books = coreDataBooks.map { $0.toDomain() }
                    promise(.success(books))
                } catch {
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}

extension CoreDataBook {
    func toDomain() -> Book {
        return Book(
            id: self.id ?? "",
            title: self.title ?? "",
            author: self.author ?? "",
            description: self.bookDescription ?? "",
            isFavorite: self.isFavorite,
            image: URL(string: self.image ?? "")!
        )
    }
}

