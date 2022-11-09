//
//  AccountStatusUseCase.swift
//  UseCase
//
//  Created by Thomas Legris on 29/09/2022.
//

import Foundation
import Domain
import Combine

/// Usecase protocol to execute the account status request.
public protocol AccountStatusUseCase {
    func execute(completion: @escaping (String) -> Void)
}
