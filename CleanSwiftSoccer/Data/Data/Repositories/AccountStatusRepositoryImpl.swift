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

    public func statusRequest(completion: @escaping (String) -> Void) {
        self.apiManager.statusRequest { response, error in
            guard let res = response, error == nil else {
                completion("0")
                return
            }
            completion(res)
        }
    }
}
