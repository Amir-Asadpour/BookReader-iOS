//
//  FavoritesViewModel.swift
//  BookReader
//
//  Created by Amir Asadpour on 9/22/24.
//

import Combine
import Factory
import Foundation

class FavoritesViewModel: BaseViewModel {
    @Injected(\.booksRepository) private var booksRepository
    
    @Published var screenState: FavoritesScreenState = .loading
    
    func getBooks() {
        booksRepository.getFavoriteBooks()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.screenState = .error(error)
                }
            } receiveValue: { [weak self] books in
                self?.screenState = .loaded(books)
            }
            .store(in: &tokens)
    }
}
