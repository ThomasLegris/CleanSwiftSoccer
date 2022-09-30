//
//  DIContainer.swift
//  UI
//
//  Created by Thomas Legris on 29/09/2022.
//

import Foundation
import UseCase
import Domain
import Presentation
import Data

/// Container to handle dependency injection inside the whole app.
final class DIContainer {
    // MARK: - Internal Properties
    static let shared: DIContainer = DIContainer()

    // MARK: - Private Init
    private init() { }
}
