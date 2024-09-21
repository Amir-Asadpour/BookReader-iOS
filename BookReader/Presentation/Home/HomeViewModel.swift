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
    
    @Published var screenState: HomeScreenState = .loading
    
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
            }
            .store(in: &tokens)
    }
}
