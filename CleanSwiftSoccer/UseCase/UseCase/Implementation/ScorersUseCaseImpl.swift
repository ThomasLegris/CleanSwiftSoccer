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
        Task(priority: .medium) {
            let topScorers = try await self.repository.topScorers(league: league)
            completion(topScorers)
        }
    }
}
