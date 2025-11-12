//
//  HomeView.swift
//  Orbit
//
//  Created by Evan Plant on 12/11/2025.
//

import SwiftUI

struct HomeView: View {
    var greeting: String {
        let hour = Calendar.current.component(.hour, from: Date())
        
        switch hour {
        case 3..<12:
            return "Good morning!"
        case 12..<17:
            return "Good afternoon!"
        default:
            return "Good evening!"
        }
    }
    
    var body: some View {
        Form {
            Section {
                let date = Date()
                let formattedDate = date.formatted(date: .complete, time: .omitted)
                VStack(alignment: .leading) {
                    Text(greeting)
                        .font(.largeTitle)
                    Text("Today's date is \(formattedDate).")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }
            } header: {
                Text("placeholder")
            }
            .listRowSeparator(.hidden)
        }
    }
}

#Preview {
    HomeView()
}
