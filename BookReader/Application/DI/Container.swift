//
//  Container.swift
//  BookReader
//
//  Created by Amir Asadpour on 9/21/24.
//

import Factory

extension Container {
    var booksRepository: Factory<BooksRepository> {
        self { BooksRepositoryImpl() }
            .singleton
    }
}
