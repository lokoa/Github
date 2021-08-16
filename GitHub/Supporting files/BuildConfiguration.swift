//
//  BuildConfiguration.swift
//  GitHub
//
//  Created by Ana Kresic on 14/08/2021.
//

import Foundation

// Configure three different environments for the app
// - test app
// - staging app
// - production app

enum Environment: String { 
    case debugTest = "Debug Test"
    case debugStaging = "Debug Staging"
    case debugProduction = "Debug Production"
    //    case releaseProduction = "Release Production"
}

class BuildConfiguration {
    static let shared = BuildConfiguration()
    var environment: Environment
    
    init() {
        let currentConfiguration = Bundle.main.object(forInfoDictionaryKey: GKey.configuration) as! String
        environment = Environment(rawValue: currentConfiguration)!
    }
}
