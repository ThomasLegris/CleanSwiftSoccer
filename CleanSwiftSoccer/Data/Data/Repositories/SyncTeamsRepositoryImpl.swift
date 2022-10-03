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
    private var persistanceManager: PersistanceManager

    public init(apiManager: APIManager,
                persistanceManager: PersistanceManager) {
        self.apiManager = apiManager
        self.persistanceManager = persistanceManager
    }

    public func syncTeam() {
        apiManager.teamsRequest { [weak self] response, error in
            guard let res = response, error == nil else { return }
            self?.persistanceManager.syncTeams(teams: res)
        }
    }
}
