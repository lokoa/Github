//
//  ErrorResponse.swift
//  GitHub
//
//  Created by Ana Kresic on 09/08/2021.
//

import Foundation

class ErrorResponse: Codable {
    var httpCode: Double
    var code: Double
    var message: String
    var details: AnyValue?
}
