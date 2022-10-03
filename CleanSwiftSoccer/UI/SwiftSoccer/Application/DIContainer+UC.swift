//
//  DIContainer+UC.swift
//  UI
//
//  Created by Thomas Legris on 30/09/2022.
//

import Foundation
import UseCase
import Domain
import Presentation
import Data

// MARK: - UseCases dependency injection
extension DIContainer {
    var accountStatusUseCase: AccountStatusUseCase {
        let useCase = AccountStatusUseCaseImpl(repository: self.statusRepository)
        return useCase
    }

    var standingUseCase: TeamsStandingUseCase {
        let useCase = TeamsStandingUseCaseImpl(repository: self.standingRepository)
        return useCase
    }

    var scorersUseCase: ScorersUseCase {
        let useCase = ScorersUseCaseImpl(repository: self.scorersRepository)
        return useCase
    }

    var syncTeamsUseCase: SyncTeamsUseCase {
        let useCase = SyncTeamsUseCaseImpl(repository: self.syncTeamsRepository)
        return useCase
    }
}

