//
//  NetworkManager.swift
//  Netflix
//
//  Created by Shishir Rijal on 24/10/2024.
//

import Foundation
import Combine



import Foundation

class NetworkManager {
    static let shared = NetworkManager() // Singleton instance

    private init() { } 

    func performRequest<T: Codable>(url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(Secrets.getAPIKey())", forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkError.badUrlResponse))
                return
            }

            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(T.self, from: data)
                completion(.success(decodedResponse))
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()
    }
}

enum NetworkError: Error {
    case badUrlResponse
    case unknown

    var errorDescription: String? {
        switch(self) {
        case .badUrlResponse:
            return "[🔥] Bad response from URL"
        case .unknown:
            return "[⚠️] An unknown error occurred."
        }
    }
}



