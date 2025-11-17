//
//  SpacebarCountView.swift
//  Orbit
//
//  Created by Evan Plant on 14/11/2025.
//

import SwiftUI

struct SpacebarCountView: View {
    @AppStorage("selectedAccentIndex") private var selectedAccentIndex = 6
    @AppStorage("selectedBackspacePositionIndex") private var selectedBackspacePositionIndex = 1
    // 0 = left, 1 = right
    
    @State private var showingClearDialog = false
    
    @AppStorage("spacebarTaps") private var spacebarTaps = 0
    
    var adaptiveForegroundColour: Color {
        baseAccentColours[selectedAccentIndex].adaptedTextColor()
    }
    
    var body: some View {
        VStack {
            Text("Spacebar clicks:")
                .padding()
            Text("\(spacebarTaps)")
                .contentTransition(.numericText(value: Double(spacebarTaps)))
                .animation(.smooth, value: spacebarTaps)
                .font(.title)
            
            HStack {
                if selectedBackspacePositionIndex == 0 {
                    Button {
                        if spacebarTaps > 0 {
                            spacebarTaps -= 1
                        }
                    } label: {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 75, height: 75)
                            .overlay {
                                Image(systemName: "delete.backward")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundStyle(adaptiveForegroundColour)
                                    .padding(20)
                            }
                    }
                }
                
                Button {
                    withAnimation {
                        spacebarTaps += 1
                    }
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 200, height: 75)
                        .overlay {
                            Image(systemName: "space")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(adaptiveForegroundColour)
                                .padding(30)
                        }
                }
                
                if selectedBackspacePositionIndex == 1 {
                    Button {
                        if spacebarTaps > 0 {
                            spacebarTaps -= 1
                        }
                    } label: {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 75, height: 75)
                            .overlay {
                                Image(systemName: "delete.backward")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundStyle(adaptiveForegroundColour)
                                    .padding(20)
                            }
                    }
                }
            }
            .padding(50)
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    showingClearDialog.toggle()
                } label: {
                    Label("Reset", systemImage: "trash")
                }
                .confirmationDialog(
                    "Reset clicks",
                    isPresented: $showingClearDialog
                ) {
                    Button("Reset", role: .destructive) { withAnimation { spacebarTaps = 0 } }
                    Button("Cancel", role: .cancel) { }
                } message: {
                    Text("This will reset your clicks to 0.\nThis cannot be undone.")
                }
            }
        }
        .navigationTitle("Spacebar clicker")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SpacebarCountView()
}
