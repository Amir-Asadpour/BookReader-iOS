//
//  Container.swift
//  BookReader
//
//  Created by Amir Asadpour on 9/21/24.
//

import Factory

extension Container {
    var remoteAPI: Factory<RemoteAPI> {
        self { URLSessionRemoteAPI() }
            .singleton
    }
    
    var booksRepository: Factory<BooksRepository> {
        self { BooksRepositoryImpl() }
            .singleton
    }
    
    var booksLocalDataSource: Factory<BooksLocalDataSource> {
        self { CoreDataBooksLocalDataSource() }
            .singleton
    }
    
    var coreDataController: Factory<CoreDataController> {
        self { CoreDataController() }
            .singleton
    }
}
