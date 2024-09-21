//
//  RemoteBook.swift
//  BookReader
//
//  Created by Amir Asadpour on 9/21/24.
//

struct RemoteBook: Codable {
    let id: String
    let title: String
    let author: String
    let description: String
    let image: String
}

extension RemoteBook {
    func toDomain(isFavorite: Bool) -> Book {
        .init(
            id: id,
            title: title,
            author: author,
            description: description,
            isFavorite: isFavorite,
            image: image.percentEncodedURL
        )
    }
}
