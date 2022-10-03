//
//  APIError.swift
//  Data
//
//  Created by Thomas Legris on 30/09/2022.
//

import Foundation

/// Model for api error.
public enum APIError: Error {
    case badUrl
    case jsonParsingError
    case defaultRequestError
}
