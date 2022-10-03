//
//  HomeStandingModel+UI.swift
//  Presentation
//
//  Created by Thomas Legris on 30/09/2022.
//

import Foundation
import SwiftUI
import Domain

/// UI Helpers for `HomeStandingModel`
extension HomeStandingModel {
    public var backgroundColor: Color {
        guard let name = self.backgroundColorName else {
            return .clear
        }
        return Color(name)
    }
}

/// UI Helpers for `ResultPosition`
extension HomeStandingModel.ResultPosition {
    public var color: Color {
        switch self {
        case .championsLeague,
                .promotion:
            return Color("red50")
        case .championsLeaguePlayoff:
            return Color("red40")
        case .europaLeague,
                .promotionPlayoffs:
            return Color("red30")
        case .europaConferenceLeague:
            return Color("red20")
        case .relagation:
            return Color("gray50")
        case .relagationPlayoff:
            return Color("gray30")
        case .same:
            return .clear
        }
    }

    public var titleColor: Color {
        switch self {
        case .same:
            return Color("gray80")
        default:
            return .white
        }
    }
}
