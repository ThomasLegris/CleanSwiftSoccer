//
//  SyncTeamsUseCaseImpl.swift
//  UseCase
//
//  Created by Thomas Legris on 30/09/2022.
//

import Foundation
import Domain

/// Implementation of teams synchronisation UC.
public class SyncTeamsUseCaseImpl: SyncTeamsUseCase {
    // MARK: - Private Properties
    private let repository: SyncTeamsRepository

    // MARK: - Init
    public init(repository: SyncTeamsRepository) {
        self.repository = repository
    }

    // MARK: - Public Funcs
    public func execute() {
        repository.syncTeam()
    }
}
