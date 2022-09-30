//
//  TeamsParser.swift
//  Data
//
//  Created by Thomas Legris on 30/09/2022.
//

import Foundation

/// Codable response for teams request.
public struct TeamsResponse: Codable {
    var data: [TeamData]
    var query: TeamQuery

    enum CodingKeys: String, CodingKey {
        case data
        case query
    }
}

// MARK: - Models
extension TeamsResponse {
    /// `data` field in API teams response.
    public struct TeamData: Codable {
        var teamId: Int
        var name: String
        var shortCode: String
        var logo: String

        enum CodingKeys: String, CodingKey {
            case teamId = "team_id"
            case name
            case shortCode = "short_code"
            case logo
        }
    }

    /// `query` field in API teams response.
    public struct TeamQuery: Codable {
        var countryId: String

        enum CodingKeys: String, CodingKey {
            case countryId = "country_id"
        }
    }
}
