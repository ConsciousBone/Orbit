//
//  SettingsView.swift
//  Orbit
//
//  Created by Evan Plant on 12/11/2025.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("selectedAccentIndex") private var selectedAccentIndex = 6
    
    @AppStorage("selectedBackspacePositionIndex") private var selectedBackspacePositionIndex = 1
    // 0 = left, 1 = right
    let backspacePositions = ["Left", "Right"]
    
    @AppStorage("issLocationRefreshInterval") private var issLocationRefreshInterval: Double = 2
    @AppStorage("showingISSDistance") private var showingISSDistance = true
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker(selection: $selectedAccentIndex) {
                        ForEach(accentColours.indices, id: \.self) { index in
                            Text(accentColourNames[index])
                        }
                    } label: {
                        Label("Accent colour", systemImage: "paintpalette")
                    }
                }
                
                Section {
                    Picker(selection: $selectedBackspacePositionIndex) {
                        ForEach(backspacePositions.indices, id: \.self) { index in
                            Text(backspacePositions[index])
                        }
                    } label: {
                        Label("Backspace position", systemImage: "delete.backward")
                    }
                } header: {
                    Text("Spacebar clicker")
                }
                
                Section {
                    Slider(
                        value: $issLocationRefreshInterval,
                        in: 1...5,
                        step: 1.0,
                        label: { Text("ISS update rate") },
                        minimumValueLabel: { Text("1") },
                        maximumValueLabel: { Text("5") }
                    )
                } header: {
                    Text("ISS update rate: \(issLocationRefreshInterval.formatted(.number.precision(.fractionLength(0))))")
                }
                
                Section {
                    Toggle(isOn: $showingISSDistance) {
                        Label("Show distance to ISS", systemImage: "point.bottomleft.filled.forward.to.point.topright.scurvepath")
                    }
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SettingsView()
}
