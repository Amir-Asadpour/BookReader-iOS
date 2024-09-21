//
//  URLSessionRemoteAPI.swift
//  BookReader
//
//  Created by Amir Asadpour on 9/21/24.
//

import Combine
import Foundation

class URLSessionRemoteAPI: RemoteAPI {
    private let urlSession = URLSession.shared
    
    private static var baseURL =
        "https://b79940d4-eac9-46eb-9f41-059e38e16a3f.mock.pstmn.io/"

    private static var booksURL: URL {
        URL(string: baseURL + "books")!
    }

    func getBooks() -> AnyPublisher<[RemoteBook], Error> {
        urlSession.dataTaskPublisher(for: URLSessionRemoteAPI.booksURL)
            .map(\.data)
            .decode(type: [RemoteBook].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
