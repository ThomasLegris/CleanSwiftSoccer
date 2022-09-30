//
//  SyncTeamsUseCase.swift
//  UseCase
//
//  Created by Thomas Legris on 30/09/2022.
//

import Foundation

protocol GetTeamsUseCase {
    func execute(completion: @escaping (String) -> Void)
}
