//
//  SyncTeamsRepositoryImpl.swift
//  Data
//
//  Created by Thomas Legris on 30/09/2022.
//

import Foundation
import Domain

public class SyncTeamsRepositoryImpl: SyncTeamsRepository {
    var apiManager: APIManager
    var persistanceManager: PersistanceManager

    public init(apiManager: APIManager, persistanceManager: PersistanceManager) {
        self.apiManager = apiManager
        self.persistanceManager = persistanceManager
    }

    public func getTeams() async throws -> String {
        return ""
    }

    public func persistTeams() {
        //
    }
}
