//
//  BlankSpaceView.swift
//  Orbit
//
//  Created by Evan Plant on 17/11/2025.
//

import SwiftUI

struct BlankSpaceView: View {
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
    }
}

#Preview {
    BlankSpaceView()
}
