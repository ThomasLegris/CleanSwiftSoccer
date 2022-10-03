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
    func statusRequest(completion: @escaping (String?, APIError?) -> Void)

    func teamsRequest(completion: @escaping (TeamsResponse?, APIError?) -> Void)

    /// Perform request of the list of league scorers and throw the response.
    ///
    /// - Parameters:
    ///     - league: the targetted league
    func topScorersRequest(league: SoccerLeague, completion: @escaping (ScorersCodable?, APIError?) -> Void)

    /// Perform request of the league standing and throw the response.
    ///
    /// - Parameters:
    ///     - league: the targetted league
    func standingRequest(league: SoccerLeague, completion: @escaping (StandingResponse?, APIError?) -> Void)
}
