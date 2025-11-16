//
//  PeopleInSpaceView.swift
//  Orbit
//
//  Created by Evan Plant on 13/11/2025.
//

import SwiftUI

struct PeopleInSpaceView: View {
    @State private var people: [PeopleInSpaceResponse.Person] = []
    @State private var errorMessage: String?
    @State private var isLoading = true
    
    var body: some View {
        Group {
            if isLoading {
                VStack {
                    ProgressView()
                    Text("Loading people in space...")
                        .foregroundStyle(.secondary)
                }
            } else if let errorMessage {
                ContentUnavailableView(
                    "Couldn't load data!",
                    systemImage: "exclamationmark.triangle",
                    description: Text(errorMessage)
                )
            } else {
                Form {
                    ForEach(people, id: \.name) { person in
                        Section {
                            Text(person.name)
                            Text("Spacecraft: \(person.craft)")
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
        }
        .navigationTitle("People in space")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await loadPeople()
        }
    }
    
    private func loadPeople() async {
        isLoading = true
        defer { withAnimation { isLoading = false } }
        do {
            let response = try await fetchPeopleInSpace()
            people = response.people
            errorMessage = nil
        } catch {
            errorMessage = error.localizedDescription
            people = []
        }
    }
}

#Preview {
    PeopleInSpaceView()
}
