//
//  APIService.swift
//  GitHub
//
//  Created by Ana Kresic on 09/08/2021.
//

import Foundation

enum Result<T> {
    case success(T)
    case error(Any?)
}

class APIService {
    
    // MARK: Enum
    
    enum HttpMethod: String {
        case post = "POST"
        case get = "GET"
        case put = "PUT"
        case delete = "DELETE"
        case patch = "PATCH"
    }
    
    // MARK: Properties
    
    private var session: URLSessionTask?
    
    // MARK: Custom func
    
    final func cancel() { session?.cancel() }
    
    // MARK: Request
    
    final func getData(request: URLRequest, method: HttpMethod = .get, completion: @escaping (Result<Data>) -> Void) {
        var request = request
        session?.cancel()
        request.httpMethod = method.rawValue
        session = URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data, let response = response as? HTTPURLResponse else { return completion(.error("error")) }
                completion((200...299).contains(response.statusCode) ? .success(data) : .error(data))
            }
        }
        session?.resume()
    }
}
