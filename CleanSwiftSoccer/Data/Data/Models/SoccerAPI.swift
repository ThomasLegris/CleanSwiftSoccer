//
//  SoccerAPI.swift
//  Data
//
//  Created by Thomas Legris on 29/09/2022.
//

import Foundation
import Alamofire

// MARK: - Enums
enum SoccerAPI {
    case status
    case standings
    case topscorers
    case teams
    case matches

    /// Provides common constants.
    private enum Constants {
        static let baseURL: String = "https://app.sportdataapi.com/api/v1/"
    }
}

// MARK: - Internal Properties
extension SoccerAPI {
    var path: String {
        var path: String = ""
        switch self {
        case .status:
            path = "status"
        case .standings:
            path = "soccer/standings"
        case .topscorers:
            path = "soccer/topscorers"
        case .teams:
            path = "soccer/teams"
        case .matches:
            path = "soccer/matches"
        }
        return Constants.baseURL + path
    }

    var url: URL? {
        return URL(string: self.path)
    }

    var httpMethod: HTTPMethod {
        return .get
    }
}
