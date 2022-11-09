//
//  TeamsStandingRepositoryImpl.swift
//  Data
//
//  Created by Thomas Legris on 30/09/2022.
//

import Foundation
import Domain

/// Repository implementation of teams standing regarding a league.
public final class TeamsStandingRepositoryImpl: TeamsStandingRepository {
    // MARK: - Private properties
    private var apiManager: APIManager
    private var persistanceManager: PersistanceManager

    // MARK: - Init
    public init(apiManager: APIManager,
                persistanceManager: PersistanceManager) {
        self.apiManager = apiManager
        self.persistanceManager = persistanceManager
    }

    // MARK: - TeamsStandingRepository Impl
    public func teamsStanding(league: SoccerLeague, completion: @escaping ([HomeStandingModel]) -> Void) {
        apiManager.standingRequest(league: league) { response, error in
            guard let res = response, error == nil else {
                completion([])
                return
            }
            // Map response in a standing model list.
            let standing: [HomeStandingModel] = res
                .data
                .standings
                .map {
                    var resultDesc: String = ""
                    if let result = $0.result {
                        resultDesc = result
                    } else {
                        resultDesc = $0.status
                    }
                    let position = HomeStandingModel.ResultPosition(rawValue: resultDesc)

                    return HomeStandingModel(teamId: $0.teamId ,
                                             teamName: self.persistanceManager.teamName(by: $0.teamId),
                                             position: String($0.position),
                                             points: String($0.points),
                                             teamIconName: self.persistanceManager.teamIcon(by: $0.teamId),
                                             goalsInOut: "\($0.overall.goalsScored):\($0.overall.goalsAgainst)",
                                             backgroundColorName: nil,
                                             resultPosition: position ?? .same)
                }
            completion(standing)
        }
    }
}
