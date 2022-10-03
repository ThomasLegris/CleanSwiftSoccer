//
//  ScorersRepositoryImpl.swift
//  Data
//
//  Created by Thomas Legris on 30/09/2022.
//

import Foundation
import Domain

public final class ScorersRepositoryImpl: ScorersRepository {
    // MARK: - Private Properties
    private var apiManager: APIManager
    private var persistanceManager: PersistanceManager

    // MARK: - Init
    public init(apiManager: APIManager,
                persistanceManager: PersistanceManager) {
        self.apiManager = apiManager
        self.persistanceManager = persistanceManager
    }

    // MARK: - Protocol Impl
    public func topScorers(league: SoccerLeague, completion: @escaping ([HomeScorerModel]) -> Void) {
        apiManager.topScorersRequest(league: league) { [weak self] response, error in
            guard let res = response, error == nil else {
                completion([])
                return
            }
            let scorers = res.data.map {
                HomeScorerModel(teamId: $0.team.teamId,
                                teamName: $0.team.teamName,
                                teamIconName: self?.persistanceManager.teamIcon(by: $0.team.teamId) ?? "",
                                playerId: $0.player.playerId,
                                playerName: $0.player.playerName,
                                position: String($0.pos),
                                goalsScored: String($0.goals.overall),
                                matchesPlayed: String($0.matchesPlayed))
            }
            completion(scorers)
        }
    }
}
