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
    var body: some View {
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
        }
    }
}

#Preview {
    SettingsView()
}
