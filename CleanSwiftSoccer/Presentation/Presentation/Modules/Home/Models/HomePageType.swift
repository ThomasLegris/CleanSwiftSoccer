//
//  HomePageType.swift
//  Presentation
//
//  Created by Thomas Legris on 30/09/2022.
//

import Foundation

// MARK: - Enums
/// Stores each home page type.
public enum HomePageType: Int, CaseIterable {
    case standing
    case scorers

    /// Return title of selected home page.
    public var title: String {
        switch self {
        case .standing:
            return L10n.homeRanking
        case .scorers:
            return L10n.homeScorers
        }
    }

    /// Return Image of page type.
    public var imageName: String {
        switch self {
        case .standing:
            return Asset.icStanding.name
        case .scorers:
            return Asset.icScorers.name
        }
    }
}
