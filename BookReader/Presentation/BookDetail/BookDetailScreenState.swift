//
//  BookDetailScreenState.swift
//  BookReader
//
//  Created by Amir Asadpour on 9/22/24.
//

enum BookDetailScreenState {
    case loaded(_ book: Book)
    case error(_ error: Error)
    case loading
}
