//
//  HomeView.swift
//  Orbit
//
//  Created by Evan Plant on 12/11/2025.
//

import SwiftUI

struct HomeView: View {
    let appDisplayName = Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String ?? "Orbit"
    let appVersionName = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "unknown"
    let appBuildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "unknown"
    
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
    
    @AppStorage("selectedTab") private var selectedTab = 0
    
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
                Text("\(appDisplayName) - version \(appVersionName) build \(appBuildNumber)")
            }
            .listRowSeparator(.hidden)
            
            Section {
                Button {
                    selectedTab = 1
                } label: {
                    Label("View the ISS's location", systemImage: "map")
                }
                
                Button {
                    selectedTab = 2
                } label: {
                    Label("Try the small things", systemImage: "ellipsis")
                }
                
                Button {
                    selectedTab = 3
                } label: {
                    Label("Change your settings", systemImage: "gear")
                }
            } header: {
                Text("Things to do in Orbit")
            }
        }
    }
}

#Preview {
    HomeView()
}
