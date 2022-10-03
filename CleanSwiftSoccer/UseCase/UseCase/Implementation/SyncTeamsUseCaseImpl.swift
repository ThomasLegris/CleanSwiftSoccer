//
//  SyncTeamsUseCaseImpl.swift
//  UseCase
//
//  Created by Thomas Legris on 30/09/2022.
//

import Foundation
import Domain

public class SyncTeamsUseCaseImpl: SyncTeamsUseCase {
    private let repository: SyncTeamsRepository

    public init(repository: SyncTeamsRepository) {
        self.repository = repository
    }
    
    public func execute() {
        repository.syncTeam()
    }
}
