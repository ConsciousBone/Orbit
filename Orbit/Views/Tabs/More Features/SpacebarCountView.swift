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
    
    @AppStorage("spacebarTaps") private var spacebarTaps = 0
    
    var adaptiveForegroundColour: Color {
        baseAccentColours[selectedAccentIndex].adaptedTextColor()
    }
    
    var body: some View {
        VStack {
            Text("Spacebar taps:")
                .padding()
            Text("\(spacebarTaps)")
                .font(.title)
            
            HStack {
                if selectedBackspacePositionIndex == 0 {
                    Button {
                        spacebarTaps -= 1
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
                    .disabled(spacebarTaps <= 0)
                }
                
                Button {
                    spacebarTaps += 1
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
                        spacebarTaps -= 1
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
                    .disabled(spacebarTaps <= 0)
                }
            }
            .padding(50)
        }
        .navigationTitle("Spacebar clicker")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SpacebarCountView()
}
