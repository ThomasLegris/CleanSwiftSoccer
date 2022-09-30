//
//  TeamsStandingUseCaseImpl.swift
//  UseCase
//
//  Created by Thomas Legris on 30/09/2022.
//

import Foundation
import Domain

public final class TeamsStandingUseCaseImpl: TeamsStandingUseCase {
    private let repository: TeamsStandingRepository

    public init(repository: TeamsStandingRepository) {
        self.repository = repository
    }

    public func execute(league: SoccerLeague, completion: @escaping ([HomeStandingModel]) -> Void) {
        Task {
            let standing = try await self.repository.teamsStanding(league: league)
            completion(standing)
        }
    }
}
