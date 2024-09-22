//
//  BookDetailViewModel.swift
//  BookReader
//
//  Created by Amir Asadpour on 9/22/24.
//

import Foundation
import Combine
import Factory

class BookDetailViewModel: BaseViewModel {

    @Injected(\.booksRepository) private var booksRepository: BooksRepository
    
    @Published var screenState = BookDetailScreenState.loading
    
    func getBookDetail(bookId: String) {
        screenState = .loading
        
        booksRepository.getBook(by: bookId)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.screenState = .error(error)
                }
            } receiveValue: { [weak self] book in
                self?.screenState = .loaded(book)
            }
            .store(in: &tokens)
    }
    
    func onFavoriteButtonTapped(book: Book) {
        var updatedBook = book
        updatedBook.isFavorite.toggle()        
        screenState = .loaded(updatedBook)
        booksRepository.updateBook(updatedBook)
            .sink { _ in } receiveValue: { _ in }
            .store(in: &tokens)
    }
}
