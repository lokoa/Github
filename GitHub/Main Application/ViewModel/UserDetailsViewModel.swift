//
//  UserDetailsViewModel.swift
//  GitHub
//
//  Created by Ana Kresic on 10/08/2021.
//

import UIKit

class UserDetailsViewModel {
    
    // MARK: Properties
    
    private let apiService = RepositoryApiService()
    var url: String
    var user : User?
//
//     init(repository: Repository) {
//        self.repository = repository
//     }
    init(url: String){
        self.url = url
        
    }
    // MARK: Func
    
   func cancelNetworkRequests() { apiService.cancel() }
}


// MARK: Networking

extension UserDetailsViewModel {
    
    func getUserDetails(url: String,  completion: @escaping () -> Void) {
        apiService.getUserDetails(url: url, completion: { [self] in
            switch $0 {
            case .success(let data):
                user = try! JSONDecoder().decode(User.self, from: data)
            case .error(let errorData):
                // Handle error message
//                defer { completion(errorMessages) }
                guard let data = errorData as? Data else { return }
//                guard let error = try? JSONDecoder().decode(ErrorResponse.self, from: data) else { return }
//                error.details.forEach { errorMessages.append($0.message) }
//                if error.details.isEmpty { errorMessages.append(error.message) }
            }
            completion()
        })
    }

}

