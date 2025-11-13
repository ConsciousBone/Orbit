//
//  MoreFeaturesView.swift
//  Orbit
//
//  Created by Evan Plant on 12/11/2025.
//

import SwiftUI

struct MoreFeaturesView: View {
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    NavigationLink {
                        Text("people in space thing")
                    } label: {
                        Label("People in space", systemImage: "figure")
                    }
                } footer: {
                    Text("See who's currently in space, and what spacecraft they're on!")
                }
                
                Section {
                    NavigationLink {
                        Text("space jokes thing")
                    } label: {
                        Label("Space jokes", systemImage: "theatermasks")
                    }
                } footer: {
                    Text("Have a laugh at some space themed jokes!")
                }
                
                Section {
                    NavigationLink {
                        Text("spacebar counter thing")
                    } label: {
                        Label("Spacebar click counter", systemImage: "space")
                    }
                } footer: {
                    Text("See how many times you can tap the *space*bar!")
                }
            }
        }
    }
}

#Preview {
    MoreFeaturesView()
}
