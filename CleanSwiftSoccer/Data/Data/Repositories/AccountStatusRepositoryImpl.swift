//
//  AccountStatusRepositoryImpl.swift
//  Data
//
//  Created by Thomas Legris on 29/09/2022.
//

import Foundation
import Domain

/// Repository implementation for account status info.
public class AccountStatusRepositoryImpl: AccountStatusRepository {
    // MARK: - Private Properties
    private var apiManager: APIManager

    // MARK: - Init
    public init(apiManager: APIManager) {
        self.apiManager = apiManager
    }

    // MARK: - AccountStatusRepository
    public func statusRequest(completion: @escaping (String) -> Void) {
        self.apiManager.statusRequest { response, error in
            guard let res = response, error == nil else {
                completion("0")
                return
            }
            completion(res)
        }
    }
}
