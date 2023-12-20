//
//  NetworkService.swift
//  ChuckNorrisJokes
//
//  Created by Andrey Kovalev on 20.12.2023.
//

import Foundation

class NetworkService {
    func downloadRandomJoke() async throws -> String {
        let (data, _) = try await URLSession.shared.data(from: URL(string: "https://api.chucknorris.io/jokes/random")!)
        let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any]
        return jsonObject?["value"] as? String ?? "-"
    }
}
