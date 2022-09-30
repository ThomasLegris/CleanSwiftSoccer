//
//  StatusResponse.swift
//  Data
//
//  Created by Thomas Legris on 29/09/2022.
//

import Foundation

struct StatusResponse: Codable {
    var remainingRequests: String

    enum CodingKeys: String, CodingKey {
        case remainingRequests = "remaining_requests"
    }
}
