//
//  Repositories.swift
//  GitHub
//
//  Created by Ana Kresic on 10/08/2021.
//

import Foundation

class Repositories: Codable {
    
    let total_count: Int
    let incomplete_results: Bool
    let items: [Repository]
    
    enum CodingKeys: String, CodingKey {
        case total_count
        case incomplete_results
        case items
    }
    
    init(totalCount: Int, incompleteResults: Bool, items: [Repository]) {
        self.total_count = totalCount
        self.incomplete_results = incompleteResults
        self.items = items
    }
}
