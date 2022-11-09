//
//  HomeStandingInteractor.swift
//  Presentation
//
//  Created by Thomas Legris on 30/09/2022.
//

import Foundation
import UseCase
import Domain

/// View model in charge of business logic in standing view.
public final class HomeStandingInteractor: BaseInteractor {
    // MARK: - Public Properties
    @Published public var rankedTeams: [HomeStandingModel] = []

    // MARK: - Private Properties
    private let useCase: TeamsStandingUseCase
    private let selectedLeague: SoccerLeague

    // MARK: - Init
    public init(selectedLeague: SoccerLeague = .ligue1, useCase: TeamsStandingUseCase) {
        self.selectedLeague = selectedLeague
        self.useCase = useCase
        super.init()

        initDataSource()
    }
}

// MARK: - Private Funcs
private extension HomeStandingInteractor {
    func initDataSource() {
        useCase.execute(league: self.selectedLeague) { teamsStanding in
            DispatchQueue.main.async {
                self.rankedTeams = teamsStanding
            }
        }
    }
}
