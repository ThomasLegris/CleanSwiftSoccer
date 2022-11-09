//
//  SyncTeamsRepository.swift
//  Domain
//
//  Created by Thomas Legris on 30/09/2022.
//

import Foundation

/// Protocol which defines all business logic calls about teams synchronisation.
public protocol SyncTeamsRepository {
    func syncTeam()
}
