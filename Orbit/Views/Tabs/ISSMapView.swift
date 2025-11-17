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
    @AppStorage("selectedAccentIndex") private var selectedAccentIndex = 6 // purple
    
    @AppStorage("issLocationRefreshInterval") private var issLocationRefreshInterval: Double = 2
    
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 25, longitude: 0),
            span: MKCoordinateSpan(latitudeDelta: 70, longitudeDelta: 70)
        )
    )
    
    @AppStorage("showingISSDistance") private var showingISSDistance = true
    
    @State private var issLat: Double = 0.0
    @State private var issLong: Double = 0.0
    @State private var issLocationTimer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    @AppStorage("issDistanceUnits") private var issDistanceUnits = 0
    // 0 is km, 1 is miles
    let distanceUnitsText = ["km", "mi"]
    
    var distanceToISS: (value: Double, unit: String)? {
        guard
            let userLocation = locationManager.currentLocation,
            issLat != 0,
            issLong != 0
        else { return nil }
        
        let issLocation = CLLocation(latitude: issLat, longitude: issLong)
        let metres = userLocation.distance(from: issLocation)
        
        switch issDistanceUnits {
        case 0: // km
            return (metres / 1000, "km")
        case 1: // mi
            return (metres / 1609.344, "mi")
        default:
            return (metres / 1000, "km")
        }
    }
    
    @AppStorage("showingISSPath") private var showingISSPath = true
    @State private var issPath: [CLLocationCoordinate2D] = []
    private func appendISSCoord() {
        guard issLat != 0, issLong != 0 else { return }
        let newCoord = CLLocationCoordinate2D(latitude: issLat, longitude: issLong)
        
        if let last = issPath.last,
           last.latitude == newCoord.latitude,
           last.longitude == newCoord.longitude {
            return // no duplicates here tyvm
        }
        issPath.append(newCoord)
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Map(position: $position, interactionModes: [.all]) {
                UserAnnotation()
                
                if issPath.count > 1 && showingISSPath {
                    MapPolyline(coordinates: issPath)
                        .stroke(accentColours[selectedAccentIndex], lineWidth: 2)
                }
                
                Marker(
                    "ISS",
                    systemImage: "dot.radiowaves.left.and.right",
                    coordinate: CLLocationCoordinate2D(latitude: issLat, longitude: issLong)
                )
                .tint(.purple)
            }
            .mapControls{
                MapCompass()
                MapPitchToggle()
                MapUserLocationButton()
            }
            .onAppear {
                print("map onappear")
                issPath = [] // remove old line
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
            .onChange(of: issLat) {
                appendISSCoord()
            }
            .onChange(of: issLong) {
                appendISSCoord()
            }
            
            if issLat != 0 || issLong != 0 {
                VStack {
                    if showingISSDistance {
                        if #available(iOS 26, *) {
                            if let distance = distanceToISS {
                                Text(String(format: "Distance to ISS: %.1f %@", distance.value, distance.unit))
                                    .padding(6.7) // siixxxxx seeeevvvvvveeeeennnnnnnn
                                    .glassEffect()
                            }
                        } else {
                            if let distance = distanceToISS {
                                Text(String(format: "Distance to ISS: %.1f %@", distance.value, distance.unit))
                                    .padding(6.7) // siixxxxx seeeevvvvvveeeeennnnnnnn
                                    .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 6.7))
                            }
                        }
                    }
                    
                    Spacer()
                    
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
                        .disabled(issLat == 0 || issLong == 0)
                    } else {
                        Button {
                            print("moving to iss")
                        } label: {
                            Label("Move to ISS", systemImage: "dot.radiowaves.left.and.right")
                        }
                        .buttonStyle(.bordered)
                        .padding()
                        .disabled(issLat == 0 || issLong == 0)
                    }
                }
            } else {
                if #available(iOS 26, *) {
                    Text("Loading...")
                        .padding(6.7) // sixx seevveeennnnnn
                        .glassEffect()
                } else {
                    Text("Loading...")
                        .padding(6.7) // is the meme dead yet
                        .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 6.7))
                }
            }
        }
    }
}

#Preview {
    ISSMapView()
}
