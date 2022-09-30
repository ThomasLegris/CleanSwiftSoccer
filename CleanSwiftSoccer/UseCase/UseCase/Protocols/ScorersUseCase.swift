//
//  ScorersUseCase.swift
//  UseCase
//
//  Created by Thomas Legris on 30/09/2022.
//

import Foundation
import Domain

public protocol ScorersUseCase {
    func execute(league: SoccerLeague, completion: @escaping ([HomeScorerModel]) -> Void)
}
