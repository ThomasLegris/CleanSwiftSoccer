//
//  ScorersUseCaseImpl.swift
//  UseCase
//
//  Created by Thomas Legris on 30/09/2022.
//

import Foundation
import Domain

/// Implementation of top scorers rank UC.
public class ScorersUseCaseImpl: ScorersUseCase {
    // MARK: - Private Properties
    private let repository: ScorersRepository

    // MARK: - Init
    public init(repository: ScorersRepository) {
        self.repository = repository
    }

    // MARK: - Public Funcs
    public func execute(league: SoccerLeague,
                        completion: @escaping ([HomeScorerModel]) -> Void) {
        self.repository.topScorers(league: league) { scorerModels in
            completion(scorerModels)
        }
    }
}
