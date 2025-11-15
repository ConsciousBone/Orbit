//
//  ISSLocationAPI.swift
//  Orbit
//
//  Created by Evan Plant on 15/11/2025.
//

import Foundation
import SwiftUI

struct ISSResponse: Codable {
    struct ISSPosition: Codable {
        let latitude: String
        let longitude: String
    }
    
    let iss_position: ISSPosition
    let message: String
    let timestamp: Int
}

func fetchISSLocation(latitude: Binding<Double>, longitude: Binding<Double>) {
    guard let url = URL(string: "http://api.open-notify.org/iss-now.json") else { return }
    
    URLSession.shared.dataTask(with: url) {data, _, error in
        guard let data = data,
              let decoded = try? JSONDecoder().decode(ISSResponse.self, from: data) else { return }
        
        DispatchQueue.main.async {
            latitude.wrappedValue = Double(decoded.iss_position.latitude) ?? 0
            longitude.wrappedValue = Double(decoded.iss_position.longitude) ?? 0
        }
    }
}
