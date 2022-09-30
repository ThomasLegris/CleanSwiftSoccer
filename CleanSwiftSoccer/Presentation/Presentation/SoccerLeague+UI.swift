//
//  SoccerLeague+UI.swift
//  Presentation
//
//  Created by Thomas Legris on 30/09/2022.
//

import Foundation
import Domain

public extension SoccerLeague {
    /// Returns soccer league name.
    var name: String {
        switch self {
        case .ligue1:
            return L10n.seasonLigue1
        case .ligue2:
            return L10n.seasonLigue2
        }
    }
}
