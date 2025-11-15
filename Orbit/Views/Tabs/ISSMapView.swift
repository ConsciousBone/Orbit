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
    @State private var issLocationTimer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Map(initialPosition: position, interactionModes: [.all]) {
            UserAnnotation()
            Marker(
                "ISS",
                systemImage: "dot.radiowaves.left.and.right",
                coordinate: CLLocationCoordinate2D(latitude: issLat, longitude: issLong)
            )
            .tint(.purple)
        }
            .mapControls{
                MapCompass()
                MapScaleView()
                MapPitchToggle()
                MapUserLocationButton()
            }
            .onAppear {
                print("map onappear")
                locationManager.requestWhenInUse()
                print("fetching location onappear")
                fetchISSLocation(latitude: $issLat, longitude: $issLong)
            }
            .onReceive(issLocationTimer) { _ in
                print("timer called, fetching location")
                fetchISSLocation(latitude: $issLat, longitude: $issLong)
            }
    }
}

#Preview {
    ISSMapView()
}
