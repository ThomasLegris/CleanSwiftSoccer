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
    /// Return status of the account (nb of remaining request).
    ///
    /// - Parameters:
    ///     - completion: callback caleld after api call which give nb and error
    func statusRequest(completion: @escaping (String?, APIError?) -> Void)

    /// Return all teams corresponding to a country.
    ///
    /// - Parameters:
    ///     - completion: callback caleld after api call which give all teams and error
    func teamsRequest(completion: @escaping (TeamsResponse?, APIError?) -> Void)

    /// Perform request of the list of league scorers and throw the response.
    ///
    /// - Parameters:
    ///     - league: the targetted league
    ///     - completion: callback called after api call which give codable and error
    func topScorersRequest(league: SoccerLeague, completion: @escaping (ScorersCodable?, APIError?) -> Void)

    /// Perform request of the league standing and throw the response.
    ///
    /// - Parameters:
    ///     - league: the targetted league
    ///     - completion: callback called after api call which give codable and error
    func standingRequest(league: SoccerLeague, completion: @escaping (StandingResponse?, APIError?) -> Void)
}
