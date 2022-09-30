//
//  APIManagerProtocol.swift
//  Data
//
//  Created by Thomas Legris on 30/09/2022.
//

import Foundation
import Domain

// MARK: - Protocols
/// Defines the api manager methods.
public protocol APIManager {
    func statusRequest() async throws -> String

    func teamsRequest() async throws -> TeamsResponse

    /// Perform request of the list of league scorers and throw the response.
    ///
    /// - Parameters:
    ///     - league: the targetted league
    func topScorersRequest(league: SoccerLeague) async throws -> ScorersCodable

    /// Perform request of the league standing and throw the response.
    ///
    /// - Parameters:
    ///     - league: the targetted league
    func standingRequest(league: SoccerLeague) async throws -> StandingResponse
}
