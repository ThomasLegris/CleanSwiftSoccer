//
//  SoccerLeague+UI.swift
//  Presentation
//
//  Created by Thomas Legris on 30/09/2022.
//

import Foundation
import Domain

/// Utility extension of `SoccerLeague`  to give property access for UI layer.
extension SoccerLeague {
    /// Returns soccer league name.
    public var name: String {
        switch self {
        case .ligue1:
            return L10n.seasonLigue1
        case .ligue2:
            return L10n.seasonLigue2
        }
    }
}
