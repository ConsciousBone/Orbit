//
//  ContentView.swift
//  Orbit
//
//  Created by Evan Plant on 12/11/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tag(0)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ISSMapView()
                .tag(1)
                .tabItem {
                    Label("ISS Tracker", systemImage: "map")
                }
            MoreFeaturesView()
                .tag(2)
                .tabItem {
                    Label("More", systemImage: "ellipsis")
                }
            SettingsView()
                .tag(3)
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}
#Preview {
    ContentView()
}
