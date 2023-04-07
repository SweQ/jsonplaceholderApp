//
//  NetworkManager.swift
//  MyCoreDataApp
//
//  Created by alexKoro on 6.04.23.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let urlSession = URLSession.shared
    
    enum Source: String {
        case users = "https://jsonplaceholder.typicode.com/users"
    }
    
    private init() { }
    
    func getData(from source: Source, _ complition: @escaping (Data) -> () ) {
        
        let url = URL(string: source.rawValue)!
        
        urlSession.dataTask(with: url) { data, response, _ in
            guard let response = response as? HTTPURLResponse,
                  (200...299).contains(response.statusCode),
                  let data = data
            else {
                print("getData error")
                return
            }
            
            complition(data)
        }.resume()
    }
}
