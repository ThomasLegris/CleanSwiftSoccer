//
//  ScorersUseCaseImpl.swift
//  UseCase
//
//  Created by Thomas Legris on 30/09/2022.
//

import Foundation
import Domain

public class ScorersUseCaseImpl: ScorersUseCase {
    private let repository: ScorersRepository

    public init(repository: ScorersRepository) {
        self.repository = repository
    }

    public func execute(league: SoccerLeague,
                        completion: @escaping ([HomeScorerModel]) -> Void) {
        self.repository.topScorers(league: league) { scorerModels in
            completion(scorerModels)
        }
    }
}
