//
//  BaseInteractor.swift
//  Presentation
//
//  Created by Thomas Legris on 29/09/2022.
//

import Foundation

/// Base view model.
public class BaseInteractor: ObservableObject {
    // MARK: - Internal Properties
    /// Common status property which will define the state of view.
    @Published public var status: ViewStatus = .idle
}
