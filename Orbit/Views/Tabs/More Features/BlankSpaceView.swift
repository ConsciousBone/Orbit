//
//  BlankSpaceView.swift
//  Orbit
//
//  Created by Evan Plant on 17/11/2025.
//

import SwiftUI

struct BlankSpaceView: View {
    @State private var showingClearDialog = false
    
    @AppStorage("blankSpaceText") private var blankSpaceText = ""
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.ultraThinMaterial)
            TextEditor(text: $blankSpaceText)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .scrollContentBackground(.hidden) // https://stackoverflow.com/a/62848618
                .padding()
        }
        .frame(width: 300, height: 500)
        .background {
            Image("StarrySky")
                .scaledToFill()
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    print("showing clear dialog")
                    showingClearDialog = true
                } label: {
                    Label("Clear", systemImage: "trash")
                }
                .confirmationDialog(
                    "Clear text",
                    isPresented: $showingClearDialog,
                ){
                    Button("Clear", role: .destructive) { withAnimation { blankSpaceText = "" } }
                    Button("Cancel", role: .cancel) { }
                } message: {
                    Text("This will clear all text in your blank space.\nThis cannot be undone.")
                }
            }
        }
    }
}

#Preview {
    BlankSpaceView()
}
