//
//  ScorersUseCase.swift
//  UseCase
//
//  Created by Thomas Legris on 30/09/2022.
//

import Foundation
import Domain

/// Usecase protocol to execute the top scorers rank request.
public protocol ScorersUseCase {
    func execute(league: SoccerLeague, completion: @escaping ([HomeScorerModel]) -> Void)
}
