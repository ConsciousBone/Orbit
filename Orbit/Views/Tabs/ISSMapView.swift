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
    
    @AppStorage("issLocationRefreshInterval") private var issLocationRefreshInterval: Double = 2
    
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
        ZStack(alignment: .bottom) {
            Map(position: $position, interactionModes: [.all]) {
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
                // update timer with the interval var
                issLocationTimer = Timer.publish(
                    every: issLocationRefreshInterval,
                    on: .main,
                    in: .common
                )
                .autoconnect()
            }
            .onReceive(issLocationTimer) { _ in
                print("timer called, fetching location")
                fetchISSLocation(latitude: $issLat, longitude: $issLong)
            }
            
            if #available(iOS 26, *) {
                Button {
                    print("moving to iss")
                    withAnimation {
                        position = MapCameraPosition.region(
                            MKCoordinateRegion(
                                center: CLLocationCoordinate2D(latitude: issLat, longitude: issLong),
                                span: MKCoordinateSpan(latitudeDelta: 70, longitudeDelta: 70)
                            )
                        )
                    }
                } label: {
                    Label("Move to ISS", systemImage: "dot.radiowaves.left.and.right")
                }
                .buttonStyle(.glass)
                .padding()
            } else {
                Button {
                    print("moving to iss")
                } label: {
                    Label("Move to ISS", systemImage: "dot.radiowaves.left.and.right")
                }
                .buttonStyle(.bordered)
                .padding()
            }
        }
    }
}

#Preview {
    ISSMapView()
}
