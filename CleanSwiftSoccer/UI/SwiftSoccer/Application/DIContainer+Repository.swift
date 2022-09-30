//
//  DIContainer+Repository.swift
//  UI
//
//  Created by Thomas Legris on 30/09/2022.
//

import Foundation
import Presentation
import Domain
import Data

// MARK: - Repositories dependency injection
extension DIContainer {
    var statusRepository: AccountStatusRepository {
        return AccountStatusRepositoryImpl(apiManager: APIManagerImpl())
    }

    var standingRepository: TeamsStandingRepository {
        return TeamsStandingRepositoryImpl(apiManager: APIManagerImpl(),
                                           persistanceManager: PersistanceManager())
    }

    var scorersRepository: ScorersRepository {
        return ScorersRepositoryImpl(apiManager: APIManagerImpl(),
                                     persistanceManager: PersistanceManager())
    }
}
