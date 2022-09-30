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
    public func topScorersRequest(league: SoccerLeague) async throws -> ScorersCodable {
        let params: [String: Any] = [Constants.keyParam: self.apiKey,
                                        Constants.seasonIdParam: league.seasonId]
        let request = try await self.request(url: SoccerAPI.topscorers.url, params: params)

        do {
            let decoder = JSONDecoder()
            let jsonResonse = try decoder.decode(ScorersCodable.self, from: request)
            return jsonResonse
        } catch let decodeError {
            print("error at top scorers request \(decodeError)")
            throw decodeError
        }
    }

    public func standingRequest(league: SoccerLeague) async throws -> StandingResponse {
        let params: [String: Any] = [Constants.keyParam: self.apiKey,
                                     Constants.seasonIdParam: league.seasonId]
        let request = try await self.request(url: SoccerAPI.standings.url, params: params)

        do {
            let decoder = JSONDecoder()
            let jsonResponse = try decoder.decode(StandingResponse.self, from: request)
            return jsonResponse
        } catch let decodeError {
            print("error at standings response \(decodeError)")
            throw decodeError
        }
    }

    public func statusRequest() async throws -> String {
        let params: [String: Any] = [Constants.keyParam: self.apiKey]
        let request = try await self.request(url: SoccerAPI.status.url, params: params)

        do {
            let decoder = JSONDecoder()
            let jsonResponse = try decoder.decode(StatusResponse.self, from: request)
            return jsonResponse.remainingRequests
        } catch let decodeError {
            print(decodeError)
            return "Status error: \(decodeError)"
        }
    }


    public func teamsRequest() async throws -> TeamsResponse {
        let params: [String: Any] = [Constants.keyParam: self.apiKey,
                                     Constants.countryIdParam: 46] // France country id
        let request = try await self.request(url: SoccerAPI.teams.url, params: params)

        do {
            let decoder = JSONDecoder()
            let jsonResonse = try decoder.decode(TeamsResponse.self, from: request)
            return jsonResonse
        } catch let decodeError {
            print("error at teams request \(decodeError)")
            throw decodeError
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
                 httpMethod: HTTPMethod = .get) async throws -> Data {
        try await withCheckedThrowingContinuation { continuation in
            guard let url = url else {
                // continuation.resume(throwing: APIError.badUrl)
                return
            }

            AF.request(url,
                       method: httpMethod,
                       parameters: params).validate().responseData { response in
                if let data = response.data {

                    continuation.resume(returning: data)
                    return
                }
                if let err = response.error {

                    continuation.resume(throwing: err)
                    return
                }

                continuation.resume(throwing: APIError.defaultRequestError)
                return
            }
        }
    }

}
