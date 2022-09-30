//
//  TeamsStandingUseCase.swift
//  UseCase
//
//  Created by Thomas Legris on 30/09/2022.
//

import Foundation
import Domain

public protocol TeamsStandingUseCase {
    func execute(league: SoccerLeague, completion: @escaping ([HomeStandingModel]) -> Void)
}
