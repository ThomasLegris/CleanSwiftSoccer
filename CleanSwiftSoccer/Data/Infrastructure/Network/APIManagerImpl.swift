//
//  APIManager.swift
//  Data
//
//  Created by Thomas Legris on 29/09/2022.
//

import Foundation
import Alamofire
import Domain

/// Manager to handle api call.
public final class APIManagerImpl {
    public init() { }

    // MARK: - Private Properties
    /// Returns the soccer API Key.
    /// Create one in `https://app.sportdataapi.com/documentation`
    private var apiKey: String {
        // return "3ecfef20-a5e1-11ec-9383-4dbcfbf527d5" // Could be stored in info.plist.
        return "eb0a4b10-3a81-11ed-a6dc-bdf9e032022a"
    }
}

// MARK: - Private Enums
private extension APIManagerImpl {
    /// Provides common constants.
    enum Constants {
        static let keyParam: String = "apikey"
        static let countryIdParam: String = "country_id"
        static let seasonIdParam: String = "season_id"
        static let statusCode: String = "status_code"
        static let dateFrom: String = "date_from"
        static let dateTo: String = "date_to"
    }
}

// MARK: - SoccerAPIManagerProtocol
extension APIManagerImpl: APIManager {
    public func statusRequest(completion: @escaping (String?, APIError?) -> Void) {
        let params: [String: Any] = [Constants.keyParam: self.apiKey]
        self.request(url: SoccerAPI.status.url, params: params) { data, error in
            guard error == nil else {
                completion(nil, error)
                return
            }
            guard let data = data else {
                completion(nil, .jsonParsingError)
                return
            }
            do {
                let decoder = JSONDecoder()
                let jsonResponse = try decoder.decode(StatusResponse.self, from: data)
                completion(jsonResponse.remainingRequests, nil)
            } catch let decodeError {
                print(decodeError)
            }
        }
    }

    public func teamsRequest(completion: @escaping (TeamsResponse?, APIError?) -> Void) {
        let params: [String: Any] = [Constants.keyParam: self.apiKey,
                                     Constants.countryIdParam: 46] // France country id
        self.request(url: SoccerAPI.teams.url, params: params) { data, error in
            guard error == nil else {
                completion(nil, error)
                return
            }
            guard let data = data else {
                completion(nil, .jsonParsingError)
                return
            }
            do {
                let decoder = JSONDecoder()
                let jsonResonse = try decoder.decode(TeamsResponse.self, from: data)
                completion(jsonResonse, nil)
            } catch let decodeError {
                completion(nil, .jsonParsingError)
                print("error at teams request \(decodeError)")
            }
        }
    }

    public func topScorersRequest(league: Domain.SoccerLeague, completion: @escaping (ScorersCodable?, APIError?) -> Void) {
        let params: [String: Any] = [Constants.keyParam: self.apiKey,
                                     Constants.seasonIdParam: league.seasonId]
        self.request(url: SoccerAPI.topscorers.url, params: params) { data, error in
            guard error == nil else {
                completion(nil, error)
                return
            }
            guard let data = data else {
                completion(nil, .jsonParsingError)
                return
            }
            do {
                let decoder = JSONDecoder()
                let jsonResonse = try decoder.decode(ScorersCodable.self, from: data)
                completion(jsonResonse, nil)
            } catch let decodeError {
                completion(nil, .jsonParsingError)
                print("error at top scorers request \(decodeError)")

            }
        }
    }

    public func standingRequest(league: Domain.SoccerLeague, completion: @escaping (StandingResponse?, APIError?) -> Void) {
        let params: [String: Any] = [Constants.keyParam: self.apiKey,
                                     Constants.seasonIdParam: league.seasonId]
        self.request(url: SoccerAPI.standings.url, params: params) { data, error in
            guard error == nil else {
                completion(nil, error)
                return
            }
            guard let data = data else {
                completion(nil, .jsonParsingError)
                return
            }
            do {
                let decoder = JSONDecoder()
                let jsonResponse = try decoder.decode(StandingResponse.self, from: data)
                completion(jsonResponse, nil )
            } catch let decodeError {
                completion(nil, .jsonParsingError)
                print("error at standings response \(decodeError)")
            }
        }
    }
}

// MARK: - Private Funcs
private extension APIManagerImpl {
    /// Create a common request with custom parameters.
    ///
    /// - Parameters:
    ///     - url: the url to reach
    ///     - params: optionnal parameters to add in request
    ///     - httpMethod: http method for request
    func request(url: URL?,
                 params: [String: Any],
                 httpMethod: HTTPMethod = .get,
                 completion:  @escaping (Data?, APIError?) -> Void) {
        guard let url = url else {
            completion(nil, .badUrl)
            return
        }

        AF.request(url,
                   method: httpMethod,
                   parameters: params).validate().responseData { response in
            if let data = response.data {
                completion(data, nil)
                return
            }

            if response.error != nil {
                print("test error response")
                completion(nil, .defaultRequestError)
                return
            }

            return
        }
    }
}
