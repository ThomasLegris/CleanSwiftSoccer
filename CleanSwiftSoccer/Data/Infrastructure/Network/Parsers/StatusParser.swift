//
//  StatusResponse.swift
//  Data
//
//  Created by Thomas Legris on 29/09/2022.
//

import Foundation

/// Codable object for account status api call.
struct StatusResponse: Codable {
    var remainingRequests: String

    enum CodingKeys: String, CodingKey {
        case remainingRequests = "remaining_requests"
    }
}
