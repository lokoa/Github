//
//  RepositoryViewModel.swift
//  GitHub
//
//  Created by Ana Kresic on 09/08/2021.
//

import UIKit

enum sortType: String {
    case stars = "stars"
    case forks = "forks"
    case updated = "updated"
}

class RepositoryViewModel {
    
    // MARK: Properties
    
    private let apiService = RepositoryApiService()
    var repositories = [Repository]()
    var sortType = GConstants.initial_sort
    lazy var defaults = UserDefaults.standard
    
    init() {}
    
    // MARK: Func
    
    func cancelNetworkRequests() { apiService.cancel() }
    func isKeyPresentInUserDefaults(key: String) -> Bool { return UserDefaults.standard.object(forKey: key) != nil }
}

// MARK: Networking

extension RepositoryViewModel {
    
    func getRepositoryList(parameters: [String: String],  completion: @escaping () -> Void) {
        apiService.cancel()
        apiService.getRepositories(params:parameters, completion: { [self] in
            switch $0 {
            case .success(let data):
                repositories = try! JSONDecoder().decode(Repositories.self, from: data).items
            case .error(let errorData):
               guard let data = errorData as? Data else { return }
            //  guard let error = try? JSONDecoder().decode(ErrorResponse.self, from: data) else { return }
            // Handle error message
            }
            completion()
        })
    }
}

