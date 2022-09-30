//
//  HomeScorersInteractor.swift
//  Presentation
//
//  Created by Thomas Legris on 30/09/2022.
//

import Foundation
import UseCase
import Domain

public final class HomeScorersInteractor: BaseInteractor {
    // MARK: - Public Properties
    @Published public var topScorers: [HomeScorerModel] = []

    // MARK: - Private Properties
    private var useCase: ScorersUseCase
    private let selectedLeague: SoccerLeague

    // MARK: - Init
    public init(selectedLeague: SoccerLeague = .ligue1,
                useCase: ScorersUseCase) {
        self.useCase = useCase
        self.selectedLeague = selectedLeague
        super.init()

        initScorers()
    }
}

private extension HomeScorersInteractor {
    func initScorers() {
        useCase.execute(league: self.selectedLeague, completion: { scorers in
            DispatchQueue.main.async {
                self.topScorers = scorers
            }
        })
    }
}
