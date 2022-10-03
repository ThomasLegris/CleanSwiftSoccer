//
//  TeamsStandingRepository.swift
//  Domain
//
//  Created by Thomas Legris on 30/09/2022.
//

import Foundation

public protocol TeamsStandingRepository {
    func teamsStanding(league: SoccerLeague,  completion: @escaping ([HomeStandingModel]) -> Void)
}
