//
//  ScorersRepository.swift
//  Domain
//
//  Created by Thomas Legris on 30/09/2022.
//

import Foundation

public protocol ScorersRepository {
    func topScorers(league: SoccerLeague, completion: @escaping ([HomeScorerModel]) -> Void)
}
