//
//  ViewStatus.swift
//  Presentation
//
//  Created by Thomas Legris on 29/09/2022.
//

import Foundation

/// Provides different status cases.
/// Will be used to display or hide error, loader..
public enum ViewStatus {
    case idle
    case loading
    case error
}

// MARK: - Internal Properties
extension ViewStatus {
    /// Status title.
    public var title: String {
        switch self {
        case .idle:
            return ""
        case .loading:
            return L10n.commonLoading
        case .error:
            return L10n.commonError
        }
    }
}
