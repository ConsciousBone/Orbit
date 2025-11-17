//
//  BlankSpaceView.swift
//  Orbit
//
//  Created by Evan Plant on 17/11/2025.
//

import SwiftUI

struct BlankSpaceView: View {
    @FocusState var isInputActive: Bool
    @State private var showingClearDialog = false
    @AppStorage("blankSpaceBackgroundIndex") private var blankSpaceBackgroundIndex = 0
    // 0 is stars, 1 is system default
    
    @AppStorage("blankSpaceText") private var blankSpaceText = ""
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.ultraThinMaterial)
            TextEditor(text: $blankSpaceText)
                .focused($isInputActive)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .foregroundStyle(blankSpaceBackgroundIndex == 0 ? .white : .primary)
                .multilineTextAlignment(.center)
                .scrollContentBackground(.hidden) // https://stackoverflow.com/a/62848618
                .padding()
        }
        .frame(width: 300, height: 500)
        .background {
            if blankSpaceBackgroundIndex == 0 {
                Image("StarrySky")
                    .scaledToFill()
            }
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
                    Button("Clear", role: .destructive) { blankSpaceText = "" }
                    Button("Cancel", role: .cancel) { }
                } message: {
                    Text("This will clear all text in your blank space.\nThis cannot be undone.")
                }
            }
            ToolbarItem(placement: .keyboard) {
                Button {
                    isInputActive = false
                } label: {
                    Label("Close keyboard", systemImage: "xmark")
                }
                .padding()
            }
        }
    }
}

#Preview {
    BlankSpaceView()
}
