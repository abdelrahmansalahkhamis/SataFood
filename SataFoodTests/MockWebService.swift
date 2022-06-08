//
//  MockWebService.swift
//  SataFoodTests
//
//  Created by abdrahman on 08/06/2022.
//

import Foundation

@testable import SataFood

class MockNetworkService: NetworkServicesProtocol{
    
    func load<T>(resource: Resource<T>?, completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let resource = resource else {
                    return
                }
        var request = URLRequest(url: resource.url)
        request.httpMethod = resource.httpMethod.rawValue
        request.httpBody = resource.body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.urlError))
                return
            }
            do{
                let result = try? JSONDecoder().decode(T.self, from: data)
                if let result = result {
                    DispatchQueue.main.async {
                        completion(.success(result))
                        //print("yes")
                    }
                }else{
                    completion(.failure(.decodingError))
                }
            }catch(let error){
                completion(.failure(.decodingError))
                print("error is ==> \(error)")
            }
        }.resume()
    }
    
}
