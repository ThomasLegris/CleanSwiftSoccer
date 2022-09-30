//
//  AccountStatusUseCaseImpl.swift
//  UseCase
//
//  Created by Thomas Legris on 29/09/2022.
//

import Foundation
import Domain

public class AccountStatusUseCaseImpl: AccountStatusUseCase {
    private let repository: AccountStatusRepository

    public init(repository: AccountStatusRepository) {
        self.repository = repository
    }

    public func execute(completion: @escaping (String) -> Void) {
        Task(priority: .medium) {
            let status = try await repository.statusRequest()
            completion(status)
        }
    }
}
