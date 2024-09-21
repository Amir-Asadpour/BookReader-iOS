//
//  BaseViewModel.swift
//  BookReader
//
//  Created by Amir Asadpour on 9/21/24.
//

import Combine

class BaseViewModel: ObservableObject {
    internal var tokens = Set<AnyCancellable>()
}
