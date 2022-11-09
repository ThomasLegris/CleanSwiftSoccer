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
