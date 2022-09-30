//
//  SoccerLeague.swift
//  Domain
//
//  Created by Thomas Legris on 30/09/2022.
//

import Foundation

public enum SoccerLeague: String, CaseIterable {
    /// League 1 season.
    case ligue1
    /// League 2 season.
    case ligue2

    /// Returns the id of the current season regarding league.
   public var seasonId: Int {
        switch self {
        case .ligue1:
            return 2022
        case .ligue2:
            return 456
        }
    }

    /// Returns the id of the targeted league.
    public var leagueId: Int {
        switch self {
        case .ligue1:
            return 301
        case .ligue2:
            return 302
        }
    }

    /// Returns country id regarding league.
    public var countryId: Int {
        return 46
    }
}
