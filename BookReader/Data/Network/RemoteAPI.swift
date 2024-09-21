//
//  RemoteAPI.swift
//  BookReader
//
//  Created by Amir Asadpour on 9/21/24.
//

import Combine

protocol RemoteAPI {
    func getBooks() -> AnyPublisher<[RemoteBook], Error>
}
