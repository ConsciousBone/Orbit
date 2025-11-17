//
//  SpaceFactsView.swift
//  Orbit
//
//  Created by Evan Plant on 17/11/2025.
//

import SwiftUI

struct SpaceFactsView: View {
    // sources for facts:
    // https://www.astronomy.com/astronomy-for-beginners/20-unusual-space-facts/
    // https://www.spacecentre.nz/resources/facts/random/
    let spaceFacts = [
        "The ISS travels at around 17,500 mph.",
        "The ISS completely orbits Earth roughly every 90 minutes.",
        "Jupiter has at least 95 confirmed moons.",
        "It would take around 9 years of constant walking with no breaks to walk to the moon.",
        "Mars is called the Red Planet because of its red colouring, which comes from the large amount of iron oxide (also called rust) on the surface.",
        "Mercury's temperature varies from -180°C on its night side, to 430°C during the day.",
        "The Sun is 400x larger than the Moon, but also 400x as far away, making both objects appear to be the same size in our sky.",
        "Stars don't twinkle until their light passes through Earth's atmosphere.",
        "If Earth was the size of a tennis ball, the Sun would be a sphere 24 feet across, around 0.5 miles away.",
        "Neptune's moon Triton is the coldest known object in the solar system with an average surface temperature of around -235°C.",
        "When the Moon is half full (First and Last Quarter phases), it's only 10% as bright as the Full Moon.",
        "Scientists estimate that the earliest stars formed around 200 million years after the Big Bang.",
        "Jupiter's Great Red Spot, which rotates once approximately every 6 days, is an anti-cyclonic storm 22° south of the planet's equator.",
        "To escape Earth's gravity, a spacecraft must travel more than 25,008 mph, or close to Mach 33.",
        "Earth rotates once per day but its rotation is slowing by 1.4 milliseconds every century.",
        "The Earth would fit inside the Sun 1.3 million times."
    ]
    @State private var selectedFact = ""
    var body: some View {
        Form {
            Section {
                Text(selectedFact)
            }
            
            Section {
                Button {
                    selectedFact = spaceFacts.randomElement() ?? "No facts somehow???"
                } label: {
                    Label("New fact", systemImage: "shuffle")
                }
            }
        }
        .navigationTitle("Space facts")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            selectedFact = spaceFacts.randomElement() ?? "No facts somehow???"
        }
    }
}

#Preview {
    SpaceFactsView()
}
