//
//  AccountStatusRepository.swift
//  Domain
//
//  Created by Thomas Legris on 29/09/2022.
//

import Foundation

public protocol AccountStatusRepository {
    func statusRequest() async throws -> String
}
