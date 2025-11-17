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
                        PeopleInSpaceView()
                    } label: {
                        Label("People in space", systemImage: "figure")
                    }
                } footer: {
                    Text("See who's currently in space, and what spacecraft they're on!")
                }
                
                Section {
                    NavigationLink {
                        SpaceJokesView()
                    } label: {
                        Label("Space jokes", systemImage: "theatermasks")
                    }
                } footer: {
                    Text("Have a laugh at some space themed jokes!")
                }
                
                Section {
                    NavigationLink {
                        SpaceFactsView()
                    } label: {
                        Label("Space facts", systemImage: "brain")
                    }
                } footer: {
                    Text("Gain some space knowledge with some facts about space!")
                }
                
                Section {
                    NavigationLink {
                        SpacebarCountView()
                    } label: {
                        Label("Spacebar clicker", systemImage: "space")
                    }
                } footer: {
                    Text("See how many times you can tap the *space*bar!")
                }
                
                Section {
                    NavigationLink {
                        BlankSpaceView()
                    } label: {
                        Label("Blank space", systemImage: "doc")
                    }
                } footer: {
                    Text("Literally a blank space for you to write notes, let out feelings, or any endless uses.")
                }
            }
            .navigationTitle("More features")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    MoreFeaturesView()
}
