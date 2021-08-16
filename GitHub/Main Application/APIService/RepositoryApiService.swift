//
//  RepositoryApiService.swift
//  GitHub
//
//  Created by Ana Kresic on 09/08/2021.
//

import Foundation

class RepositoryApiService: APIService {
    
    // MARK: Properties
    
    private var searchRepositoryURL: String { "https://api.github.com/search/repositories" }
    
    // MARK: Search repositories request
    
    func getRepositories(params: [String: String], completion: @escaping (Result<Data>) -> Void) {
        var urlComponents = URLComponents(string: searchRepositoryURL).self
        urlComponents?.setQueryItems(with: params)
        guard let url = urlComponents?.url else { return completion(.error(nil)) }
        var request = URLRequest(url: url)
        request.addValue(GKey.application_vnd_github_v3_json, forHTTPHeaderField: GKey.accept)
        getData(request: request, completion: { completion($0) })
    }
    
    // MARK: Get user details request
    
    func getUserDetails(url: String, completion: @escaping (Result<Data>) -> Void) {
        guard let url = URL(string: url) else { return completion(.error(nil)) }
        getData(request: URLRequest(url: url), completion: { completion($0) })
    }
}
