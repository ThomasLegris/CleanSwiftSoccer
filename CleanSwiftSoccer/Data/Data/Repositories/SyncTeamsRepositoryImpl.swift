//
//  SyncTeamsRepositoryImpl.swift
//  Data
//
//  Created by Thomas Legris on 30/09/2022.
//

import Foundation
import Domain

public class SyncTeamsRepositoryImpl: SyncTeamsRepository {
    private var apiManager: APIManager

    public init(apiManager: APIManager) {
        self.apiManager = apiManager
    }

    public func syncTeam() {
        Task(priority: .medium) {
            let teams = try await apiManager.teamsRequest()

               // PersistanceManager.shared.syncTeams(teams: teams)
            
        }
    }
}
