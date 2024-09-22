//
//  FavoritesScreenState.swift
//  BookReader
//
//  Created by Amir Asadpour on 9/22/24.
//

enum FavoritesScreenState {
    case loading
    case loaded([Book])
    case error(Error)
}
