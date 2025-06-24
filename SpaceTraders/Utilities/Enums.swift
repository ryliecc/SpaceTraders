//
//  Enums.swift
//  SpaceTraders
//
//  Created by Rylie Castell on 24.06.25.
//

import Foundation

enum HTTPError: Error {
    case invalidURL, fetchFailed
    
    var message: String {
        switch self {
        case .invalidURL: "URL is invalid"
        case .fetchFailed: "Fetch failed"
        }
    }
}
