//
//  PeopleInSpaceAPI.swift
//  Orbit
//
//  Created by Evan Plant on 16/11/2025.
//

import Foundation

struct PeopleInSpaceResponse: Codable {
    struct Person: Codable {
        let craft: String
        let name: String
    }
    
    let people: [Person]
    let number: Int
    let message: String
}

func fetchPeopleInSpace() async throws -> PeopleInSpaceResponse {
    guard let url = URL(string: "http://api.open-notify.org/astros.json") else {
        throw URLError(.badURL)
    }
    
    let (data, _) = try await URLSession.shared.data(from: url)
    return try JSONDecoder().decode(PeopleInSpaceResponse.self, from: data)
}
