//
//  HomeInteractor.swift
//  Presentation
//
//  Created by Thomas Legris on 29/09/2022.
//

import Foundation
import UseCase

/// Home screen related viewmodel
public class HomeInteractor: BaseInteractor {
    // MARK: - Private Properties
    private let statusUseCase: AccountStatusUseCase
    private let syncUseCase: SyncTeamsUseCase

    // MARK: - Init
    public init(statusUseCase: AccountStatusUseCase,
                syncUseCase: SyncTeamsUseCase) {
        self.statusUseCase = statusUseCase
        self.syncUseCase = syncUseCase

        super.init()
        self.getStatus()
        self.syncTeams()
    }

    /// Get account status (remaining call).
    // TODO: To add in a futur `setting` screen.
    func getStatus() {
        Task(priority: .medium) {
            statusUseCase.execute { status in
                print("test status = \(status)")
            }
            DispatchQueue.main.async {

                // Also use Defaults.appLaunchCounter ?
                // self.status = "Remaining call = \(statusResponse)"
            }
        }
    }

    /// Synchronize team with api and persist the list from server response.
    func syncTeams() {
        self.syncUseCase.execute()
    }
}
