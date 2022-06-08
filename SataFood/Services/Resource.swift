//
//  Resource.swift
//  SataFood
//
//  Created by abdrahman on 07/06/2022.
//

import Foundation

enum NetworkError: Error{
    case decodingError
    case domainError
    case urlError
}

enum HttpMethod: String{
    case get = "GET"
    case post = "POST"
}

struct Resource<T: Codable> {
    let url: URL
    var httpMethod: HttpMethod = .get
    var body: Data? = nil
}

extension Resource{
    init(url: URL){
        self.url = url
    }
}
