//
//  ISSMapView.swift
//  Orbit
//
//  Created by Evan Plant on 12/11/2025.
//

import SwiftUI
import MapKit
import Combine

struct ISSMapView: View {
    @StateObject private var locationManager = LocationManager()
    
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 25, longitude: 0),
            span: MKCoordinateSpan(latitudeDelta: 70, longitudeDelta: 70)
        )
    )
    
    @State private var issLat: Double = 0.0
    @State private var issLong: Double = 0.0
    @State private var issLocationTimer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Map(initialPosition: position, interactionModes: [.all]) {
            UserAnnotation()
        }
            .mapControls{
                MapCompass()
                MapScaleView()
                MapPitchToggle()
                MapUserLocationButton()
            }
            .onAppear {
                locationManager.requestWhenInUse()
                fetchISSLocation(latitude: $issLat, longitude: $issLong)
            }
            .onReceive(issLocationTimer) { _ in
                fetchISSLocation(latitude: $issLat, longitude: $issLong)
            }
    }
}

#Preview {
    ISSMapView()
}
