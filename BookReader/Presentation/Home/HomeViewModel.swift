//
//  HomeViewModel.swift
//  BookReader
//
//  Created by Amir Asadpour on 9/21/24.
//

import Foundation
import Combine
import Factory

class HomeViewModel: BaseViewModel {
    @Injected(\.booksRepository) private var booksRepository
    
    private var allBooks: [Book] = []
    
    @Published var screenState: HomeScreenState = .loading
    @Published var query = "" {
        didSet { filterBooks(query) }
    }
    
    func getBooks() {
        if case .loaded = screenState { return }
        
        screenState = .loading
        
        booksRepository.getBooks()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                    self?.screenState = .error(error)
                }
            } receiveValue: { [weak self] books in
                self?.screenState = .loaded(books)
                self?.allBooks = books
            }
            .store(in: &tokens)
    }
    
    private func filterBooks(_ query: String) {
        if query.isEmpty {
            screenState = .loaded(allBooks)
        } else {
            let filterdBooks = allBooks.filter {
                $0.title.lowercased().contains(query.lowercased()) ||
                $0.author.lowercased().contains(query.lowercased())
            }
            screenState = .loaded(filterdBooks)
        }
    }
}
