//
//  ISSLocationAPI.swift
//  Orbit
//
//  Created by Evan Plant on 15/11/2025.
//

import Foundation

struct ISSResponse: Codable {
    struct ISSPosition: Codable {
        let latitude: String
        let longitude: String
    }
    
    let iss_position: ISSPosition
    let message: String
    let timestamp: Int
}

func fetchISSLocation(latitude: Int, longitude: Int) {
    guard let url = URL(string: "http://api.open-notify.org/iss-now.json") else { return }
}
