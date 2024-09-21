//
//  HomeViewState.swift
//  BookReader
//
//  Created by Amir Asadpour on 9/21/24.
//

enum HomeScreenState {
    case loading
    case loaded([Book])
    case error(Error)
}
