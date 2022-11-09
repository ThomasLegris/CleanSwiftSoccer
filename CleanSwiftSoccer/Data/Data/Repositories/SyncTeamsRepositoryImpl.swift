//
//  SyncTeamsRepositoryImpl.swift
//  Data
//
//  Created by Thomas Legris on 30/09/2022.
//

import Foundation
import Domain

/// Repository implementation to sync all teams.
public class SyncTeamsRepositoryImpl: SyncTeamsRepository {
    // MARK: - Private properties
    private var apiManager: APIManager
    private var persistanceManager: PersistanceManager

    // MARK: - Init
    public init(apiManager: APIManager,
                persistanceManager: PersistanceManager) {
        self.apiManager = apiManager
        self.persistanceManager = persistanceManager
    }

    // MARK: - SyncTeamsRepository Impl
    public func syncTeam() {
        apiManager.teamsRequest { [weak self] response, error in
            guard let res = response, error == nil else { return }
            self?.persistanceManager.syncTeams(teams: res)
        }
    }
}
