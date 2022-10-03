//
//  DIContainer+Home.swift
//  UI
//
//  Created by Thomas Legris on 30/09/2022.
//


import Foundation
import UseCase
import Domain
import Presentation

// MARK: - Interactors dependency injection
extension DIContainer {
    var homeInteractor: HomeInteractor {
        return HomeInteractor(statusUseCase: accountStatusUseCase,
                              syncUseCase: self.syncTeamsUseCase)
    }

    var homeContentInteractor: HomeContentInteractor {
        return HomeContentInteractor()
    }

    func homeStandingInteractor(selectedLeague: SoccerLeague) -> HomeStandingInteractor {
        return HomeStandingInteractor(selectedLeague: selectedLeague, useCase: self.standingUseCase)
    }

    func homeScorersInteractor(selectedLeague: SoccerLeague) -> HomeScorersInteractor {
        return HomeScorersInteractor(selectedLeague: selectedLeague, useCase: self.scorersUseCase)
    }
}
