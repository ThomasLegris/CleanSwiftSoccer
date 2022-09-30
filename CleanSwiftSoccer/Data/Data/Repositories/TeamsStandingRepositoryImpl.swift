//
//  TeamsStandingRepositoryImpl.swift
//  Data
//
//  Created by Thomas Legris on 30/09/2022.
//

import Foundation
import Domain

public final class TeamsStandingRepositoryImpl: TeamsStandingRepository {
    private var apiManager: APIManager
    private var persistanceManager: PersistanceManager

    public init(apiManager: APIManager,
                persistanceManager: PersistanceManager) {
        self.apiManager = apiManager
        self.persistanceManager = persistanceManager
    }

    public func teamsStanding(league: SoccerLeague) async throws -> [HomeStandingModel] {
        do {
            let standings = try await apiManager.standingRequest(league: league)
            
            // map response in a standing model list.
            let standing: [HomeStandingModel] = standings
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
                                             backgroundColorName: nil, // FIXME: Bizarre
                                             positionBackgroundColorName: position?.rawValue,
                                             positionTextColorName: position?.rawValue) // TODO: just position à passer, pas besoin de background ou title
                }

            return standing
        } catch let error {
            print("test error: \(error)")
            return []

        }
    }

}
