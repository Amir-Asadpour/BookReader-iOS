//
//  StringExtensions.swift
//  BookReader
//
//  Created by Amir Asadpour on 9/21/24.
//
import Foundation

extension String {
    var percentEncodedURL: URL {
        URL(string: addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)!)!
    }
}
