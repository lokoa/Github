//
//  RepoDetailsViewModel.swift
//  GitHub
//
//  Created by Ana Kresic on 11/08/2021.
//

import UIKit

class RepoDetailsViewModel {
    
    // MARK: Properties
    
    private let apiService = RepositoryApiService()
    var repository: Repository
    
     init(repository: Repository) {
        self.repository = repository
     }
    
    // MARK: Func
    
    func cancelNetworkRequests() { apiService.cancel() }
}
