//
//  PersistanceManagerProtocol.swift
//  Data
//
//  Created by Thomas Legris on 03/10/2022.
//

import Foundation

public protocol PersistanceManager {
    /// Synchronize database with all Teams.
    ///
    /// - Parameters:
    ///    - teams: teams from api call
    func syncTeams(teams: TeamsResponse)

    /// Returns team name.
    ///
    /// - Parameters:
    ///     - teamId: id of the team stored
    func teamName(by teamId: Int) -> String
    /// Returns team icon.
    ///
    /// - Parameters:
    ///     - teamId: id of the team stored
    func teamIcon(by teamId: Int) -> String
}
