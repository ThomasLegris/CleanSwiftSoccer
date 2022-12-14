//
//  HomeStandingModel.swift
//  Domain
//
//  Created by Thomas Legris on 30/09/2022.
//

import Foundation

/// Main model for standing feature.
public struct HomeStandingModel {
    // MARK: - Public Properties
    public var teamId: Int
    public var teamName: String
    public var position: String
    public var points: String
    public var teamIconName: String
    public var goalsInOut: String
    public var backgroundColorName: String?
    public var resultPosition: HomeStandingModel.ResultPosition

    // MARK: - Init
    public init(teamId: Int,
                teamName: String,
                position: String,
                points: String,
                teamIconName: String,
                goalsInOut: String,
                backgroundColorName: String? = nil,
                resultPosition: HomeStandingModel.ResultPosition) {
        self.teamId = teamId
        self.teamName = teamName
        self.position = position
        self.points = points
        self.teamIconName = teamIconName
        self.goalsInOut = goalsInOut
        self.backgroundColorName = backgroundColorName
        self.resultPosition = resultPosition
    }

    // MARK: - Constants
    public enum ResultPosition: String {
        case championsLeague = "Champions League"
        case championsLeaguePlayoff = "Champions League Qualification"
        case europaLeague = "UEFA Europa League"
        case europaConferenceLeague = "Conference League Qualification"
        case same
        case relagation = "Relegation"
        case relagationPlayoff = "Relegation Playoff"
        // case for 2nd league level.
        case promotion = "Promotion"
        case promotionPlayoffs = "Promotion Playoffs"
    }
}
