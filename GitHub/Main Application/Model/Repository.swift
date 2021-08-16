//
//  Repository.swift
//  GitHub
//
//  Created by Ana Kresic on 10/08/2021.
//

import Foundation

class Repository: Codable {
    let id: Int
    let name, full_name: String
    let description, language: String?
    let owner: Owner
    let html_url, contributors_url, created_at: String
    let stargazers_count, watchers, forks, open_issues: Int
    
    init(id: Int, name: String, full_name: String, description: String?, language: String?, owner: Owner, html_url: String, contributors_url: String, created_at: String, stargazers_count: Int, watchers: Int, forks: Int, open_issues: Int) {
        self.id = id
        self.name = name
        self.full_name = full_name
        self.description = description
        self.language = language
        self.owner = owner
        self.html_url = html_url
        self.contributors_url = contributors_url
        self.created_at = created_at
        self.stargazers_count = stargazers_count
        self.watchers = watchers
        self.forks = forks
        self.open_issues = open_issues
    }
}

class Owner: Codable {
    let login: String
    let avatar_url, url: String
}
