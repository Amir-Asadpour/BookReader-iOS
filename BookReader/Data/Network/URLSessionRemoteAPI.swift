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
        URL(string:"https://b79940d4-eac9-46eb-9f41-059e38e16a3f.mock.pstmn.io/")!

    func getBooks() -> AnyPublisher<[RemoteBook], Error> {
        let url = URLSessionRemoteAPI.baseURL.appendingPathComponent("books")
        return urlSession.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [RemoteBook].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
