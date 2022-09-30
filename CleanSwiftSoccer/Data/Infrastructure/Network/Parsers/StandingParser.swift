//
//  MatchesParser.swift
//  Data
//
//  Created by Thomas Legris on 30/09/2022.
//

import Foundation

/// Codable response for league standing request.
public struct StandingResponse: Codable {
    var data: StandingData
    var query: StandingQuery

    enum CodingKeys: String, CodingKey {
        case data
        case query
    }
}

// MARK: - Models
extension StandingResponse {
    /// `data` field in API standing response.
    public struct StandingData: Codable {
        var seasonId: Int
        var leagueId: Int
        var standings: [StandingField]

        enum CodingKeys: String, CodingKey {
            case seasonId = "season_id"
            case leagueId = "league_id"
            case standings
        }
    }

    /// `query` field in API standing response.
    public struct StandingQuery: Codable {
        var seasonId: String

        enum CodingKeys: String, CodingKey {
            case seasonId = "season_id"
        }
    }

    /// Object for `standings` list field in response.
    public struct StandingField: Codable {
        var teamId: Int
        var position: Int
        var points: Int
        var status: String
        var result: String?
        var overall: OverallField

        enum CodingKeys: String, CodingKey {
            case teamId = "team_id"
            case position
            case points
            case overall
            case status
            case result
        }
    }

    /// `overall` field in response.
    public struct OverallField: Codable {
        var gamesPlayed: Int
        var won: Int
        var draw: Int
        var lost: Int
        var goalsDiff: Int
        var goalsScored: Int
        var goalsAgainst: Int

        enum CodingKeys: String, CodingKey {
            case gamesPlayed = "games_played"
            case won
            case draw
            case lost
            case goalsDiff = "goals_diff"
            case goalsScored = "goals_scored"
            case goalsAgainst = "goals_against"
        }
    }
}
