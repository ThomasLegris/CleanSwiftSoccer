//
//  HomeScorerModel.swift
//  Domain
//
//  Created by Thomas Legris on 30/09/2022.
//

import Foundation

/// Model for a selected scorer.
public struct HomeScorerModel {
    public var teamId: Int
    public var teamName: String
    public var teamIconName: String
    public var playerId: Int
    public var playerName: String
    public var position: String
    public var goalsScored: String
    public var matchesPlayed: String

    public init(teamId: Int,
                teamName: String,
                teamIconName: String,
                playerId: Int,
                playerName: String,
                position: String,
                goalsScored: String,
                matchesPlayed: String) {
        self.teamId = teamId
        self.teamName = teamName
        self.teamIconName = teamIconName
        self.playerId = playerId
        self.playerName = playerName
        self.position = position
        self.goalsScored = goalsScored
        self.matchesPlayed = matchesPlayed
    }
}
