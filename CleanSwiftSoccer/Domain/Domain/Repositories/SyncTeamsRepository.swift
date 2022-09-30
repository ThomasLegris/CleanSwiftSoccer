//
//  SyncTeamsRepository.swift
//  Domain
//
//  Created by Thomas Legris on 30/09/2022.
//

import Foundation

public protocol SyncTeamsRepository {
    func getTeams() async throws -> String
    func persistTeams()
}
