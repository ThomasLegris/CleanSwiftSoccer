//
//  TeamsStandingUseCaseImpl.swift
//  UseCase
//
//  Created by Thomas Legris on 30/09/2022.
//

import Foundation
import Domain

/// Implementation of football teams rank UC.
public final class TeamsStandingUseCaseImpl: TeamsStandingUseCase {
    // MARK: - Private Properties
    private let repository: TeamsStandingRepository

    // MARK: - Init
    public init(repository: TeamsStandingRepository) {
        self.repository = repository
    }

    // MARK: - Public Funcs
    public func execute(league: SoccerLeague, completion: @escaping ([HomeStandingModel]) -> Void) {
        self.repository.teamsStanding(league: league) { standingModels in
            completion(standingModels)
        }
    }
}
