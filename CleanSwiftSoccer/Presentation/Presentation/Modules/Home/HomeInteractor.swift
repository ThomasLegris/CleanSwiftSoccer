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
    var statusUseCase: AccountStatusUseCase
    // TODO: let syncUseCase: SyncTEamsx<UseCase

    // MARK: - Init
    public init(statusUseCase: AccountStatusUseCase) {
        self.statusUseCase = statusUseCase

        super.init()
        self.getStatus()
        self.syncTeams()
        syncTeams()
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
//        Task(priority: .medium) {
//            let teamsResponse = try await apiManager.teamsRequest()
//            DispatchQueue.main.async {
//                PersistanceManager.shared.syncTeams(teams: teamsResponse)
//            }
//        }
    }
}
