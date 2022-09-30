//
//  AccountStatusRepositoryImpl.swift
//  Data
//
//  Created by Thomas Legris on 29/09/2022.
//

import Foundation
import Domain

public class AccountStatusRepositoryImpl: AccountStatusRepository {
    private var apiManager: APIManager


    public init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    public func statusRequest() async throws -> String {
        print("toto")
        // Init an async task and perform api request.
        Task(priority: .medium) {
            let status = try await apiManager.statusRequest()
            return status
        }
        return "toto"
    }
}
