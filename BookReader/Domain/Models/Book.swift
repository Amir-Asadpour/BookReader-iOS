//
//  Book.swift
//  BookReader
//
//  Created by Amir Asadpour on 9/21/24.
//
import Foundation

struct Book: Equatable {
    let id: String
    let title: String
    let author: String
    let description: String
    var isFavorite: Bool
    let image: URL
}
