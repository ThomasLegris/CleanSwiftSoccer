//
//  AccountStatusUseCaseImpl.swift
//  UseCase
//
//  Created by Thomas Legris on 29/09/2022.
//

import Foundation
import Domain

/// Implementation of status of account UC.
public class AccountStatusUseCaseImpl: AccountStatusUseCase {
    // MARK: - Private Properties
    private let repository: AccountStatusRepository

    // MARK: - Init
    public init(repository: AccountStatusRepository) {
        self.repository = repository
    }

    // MARK: - Public Funcs
    public func execute(completion: @escaping (String) -> Void) {
        repository.statusRequest() { remainingCall in
            completion(remainingCall)
        }
    }
}
