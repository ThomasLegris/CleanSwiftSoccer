//
//  AccountStatusRepository.swift
//  Domain
//
//  Created by Thomas Legris on 29/09/2022.
//

import Foundation

/// Protocol which defines all business logic calls about user account status.
public protocol AccountStatusRepository {
    func statusRequest(completion: @escaping (String) -> Void)
}
