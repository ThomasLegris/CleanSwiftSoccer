//
//  PersistanceManager.swift
//  Data
//
//  Created by Thomas Legris on 30/09/2022.
//

import Foundation
import RealmSwift

// TODO: Protocol
/// Manager to persist data in manager.
public final class PersistanceManagerImpl {
    // MARK: - Private Properties
    private var dataBase: Realm?
    private var teams: Results<TeamsObject>? {
        return dataBase?.objects(TeamsObject.self)
    }

    // MARK: - Init
    public init() {
        do {
            dataBase = try Realm()
        } catch {
            print("error on database creation")
        }
    }
}

// MARK: - Internal Funcs
extension PersistanceManagerImpl: PersistanceManager {
    public func syncTeams(teams: TeamsResponse) {
        var teamsObjects: [TeamObject] = teams.data.map {
            let team = TeamObject()
            team.iconName = $0.logo
            team.shortName = $0.shortCode
            team.name = $0.name
            team.identifier = $0.teamId
            return team
        }

        // Fix WS bug.
        teamsObjects.append(missingAPITeam)

        let object = TeamsObject()
        object.teams.append(objectsIn: teamsObjects)
        object.countryId = teams.query.countryId

        /// Stores in database the teams list.
        try? dataBase?.write {
            dataBase?.add(object)
        }
    }

    public func teamName(by teamId: Int) -> String {
        guard let selectedTeam = self.getTeam(with: teamId) else { return "" }

        return selectedTeam.name
    }

    public func teamIcon(by teamId: Int) -> String {
        guard let selectedTeam = self.getTeam(with: teamId) else { return "" }

        return selectedTeam.iconName
    }
}

// MARK: - Private Funcs
private extension PersistanceManagerImpl {
    func getTeam(with teamId: Int) -> TeamObject? {
        guard let selectedTeam = teams?.first?.teams.first(where: { $0.identifier == teamId }) else { return nil }

        return selectedTeam
    }

    /// Returns a team object related to an API issue (Monaco not provided).
    /// FIXME: To remove
    var missingAPITeam: TeamObject {
        let missingTeam = TeamObject()
        missingTeam.iconName = "https://cdn.sportdataapi.com/images/soccer/teams/100/9052.png"
        missingTeam.shortName = "ASM"
        missingTeam.name = "AS Monaco"
        missingTeam.identifier = 3770
        return missingTeam
    }
}
