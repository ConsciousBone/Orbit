//
//  ISSMapView.swift
//  Orbit
//
//  Created by Evan Plant on 12/11/2025.
//

import SwiftUI
import MapKit

struct ISSMapView: View {
    let position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 25, longitude: 0),
            span: MKCoordinateSpan(latitudeDelta: 70, longitudeDelta: 70)
        )
    )
    
    var body: some View {
        Map(initialPosition: position)
    }
}

#Preview {
    ISSMapView()
}
