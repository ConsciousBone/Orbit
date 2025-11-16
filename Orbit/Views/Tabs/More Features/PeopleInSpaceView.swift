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
    
    var body: some View {
        Form {
            ForEach(people, id: \.name) { person in
                Section {
                    Text(person.name)
                    Text(person.craft)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .task {
            await loadPeople()
        }
    }
    
    private func loadPeople() async {
            do {
                let response = try await fetchPeopleInSpace()
                people = response.people
            } catch {
                errorMessage = error.localizedDescription
            }
        }
}

#Preview {
    PeopleInSpaceView()
}
