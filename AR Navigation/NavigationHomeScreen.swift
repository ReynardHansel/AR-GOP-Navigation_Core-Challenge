//
//  NavigationHomeScreen.swift
//  AR Navigation
//
//  Created by Reynard Hansel on 24/03/25.
//

import CoreLocation
import MapKit
import SwiftUI

struct NavigationHomeScreen: View {
    // Location Manager to track user position
    @StateObject private var locationManager = LocationManager()

    // Map camera position
    @State private var cameraPosition: MapCameraPosition = .userLocation(
        fallback: .automatic)

    // Search State
    @State private var searchText = ""
    @State private var selectedDestination: Destination? = nil
    @FocusState private var isSearchBarFocused: Bool

    // Access / import destination data (from: Destination.swift)
    let destinations = destinationDB

    var filteredDestinations: [Destination] {
        if searchText.isEmpty { return destinations }  //* --> returns all list (no filter)

        return destinations.filter {
            $0.name.localizedCaseInsensitiveContains(searchText)
        }  //* --> returns filtered list based on search value
    }
    //* --> This is a computed property. LEARN MORE ABOUT THIS!. Intinya yg gw tangkep: provides a getter and setter (optional)

    var body: some View {
        ZStack {
            // Map as background
            Map(position: $cameraPosition) {
                UserAnnotation()

                //* NOTE: How the note below works:
                // If selectedDestination && locationManager.lastLocation is not nil (safely unwraps those 2 variables) --> Than the MapPolyline will be made. If not, the code will simply not execute
                if let destination = selectedDestination,
                    let currentLocation = locationManager.lastLocation
                {
                    MapPolyline(coordinates: [
                        currentLocation.coordinate,
                        destination.nearestCoordinate,
                        destination.destinationCoordinate,
                    ])
                    .stroke(Color.blue, lineWidth: 5)
                }
            }
            .mapControls {
                MapUserLocationButton()
            }
            .mapStyle(.standard(pointsOfInterest: .all))
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                locationManager.requestLocation()
            }
            //            .onChange(of: locationManager.lastLocation) { newLocation in
            //                if let location = newLocation {
            //                    cameraPosition = .region(MKCoordinateRegion(
            //                        center: location.coordinate,
            //                        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            //                    ))
            //                }
            //            }

            VStack {
                // Search bar
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search Destination", text: $searchText)
//                        .onTapGesture { isSearchBarFocused = true }
                        .focused($isSearchBarFocused)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(50)
                .padding(.top, 10)
                
                if isSearchBarFocused || !searchText.isEmpty {
                    SearchResult(destinations: filteredDestinations, selectedDestination: $selectedDestination)
                }

                Spacer()
                
                // Confirm Destination Modal
                ConfirmDestinationModal()
            }
            .padding(.horizontal)
            
                    
        }
        .onTapGesture { isSearchBarFocused = false }
    }
}


// LocationManager Class
class LocationManager: NSObject, ObservableObject {
    @Published var lastLocation: CLLocation?

    private let locationManager = CLLocationManager()

    override init() {
        super.init()
        locationManager.delegate = self
    }

    func requestLocation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(
        _ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]
    ) {
        guard let location = locations.first else { return }
        lastLocation = location
    }

    func locationManager(
        _ manager: CLLocationManager, didFailWithError error: Error
    ) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
}

#Preview {
    NavigationHomeScreen()
}

//* NOTE:

//************* Kenapa di bbrp variable ada ($)?: ****************
//* ($) = binding
//* kl gapake ($): read-only, cmn nampilin data nya aja
//* kl pake ($): bisa read-write, bisa ngubah / update si data nya

//************* Core Location (CLLocationManager): ***************
//* While SwiftUI itself is a modern Swift framework, you're also using CoreLocation through the `CLLocationManager` class. CoreLocation is an older framework that was built with Objective-C, and its delegate protocols (like `CLLocationManagerDelegate`) are Objective-C protocols that require the Objective-C runtime.
//*
//* In Swift, when you want to conform to an Objective-C protocol that inherits from `NSObjectProtocol` (which `CLLocationManagerDelegate` does), your class must inherit from `NSObject`. This is a requirement regardless of whether your UI layer is SwiftUI, UIKit, or something else.
//*
//* The good news is that this inheritance is isolated to just your `LocationManager` class - the rest of your SwiftUI code can remain pure Swift without Objective-C dependencies.
