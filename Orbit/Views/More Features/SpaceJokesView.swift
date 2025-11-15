//
//  SpaceJokesView.swift
//  Orbit
//
//  Created by Evan Plant on 14/11/2025.
//

import SwiftUI

struct SpaceJoke: Identifiable {
    let id = UUID()
    let setup: String
    let punchline: String
    
    static let all: [SpaceJoke] = [
        .init(setup: "Why did the star go to school?", punchline: "To get a little brighter!"),
        .init(setup: "Why did the cow go in the spaceship?", punchline: "It wanted to see the moooooooon!"),
        .init(setup: "What do planets like to read?", punchline: "Comet books!"),
        .init(setup: "Why did Mickey Mouse go to outer space?", punchline: "He was looking for Pluto."),
        .init(setup: "What did Mars say to Saturn?", punchline: "Give me a ring sometime!"),
        .init(setup: "Why didn't the sun go to college?", punchline: "Because it already had a million degrees!"),
        .init(setup: "How do you organise a space party?", punchline: "You planet!"),
        .init(setup: "What is an astronaut's favourite chocolate?", punchline: "A Mars bar.")
    ]
}

struct SpaceJokesView: View {
    let jokes = SpaceJoke.all
    
    var body: some View {
        Text("Space jokes view")
    }
}

#Preview {
    SpaceJokesView()
}
