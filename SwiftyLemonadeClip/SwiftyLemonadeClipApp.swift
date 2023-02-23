//
//  SwiftyLemonadeClipApp.swift
//  SwiftyLemonadeClip
//

import SwiftUI
import CoreLocation

@main
struct SwiftyLemonadeClipApp: App {
    
    @StateObject private var model = SwiftyLemonadeClipModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
              .environmentObject(model)
              .onContinueUserActivity(
                NSUserActivityTypeBrowsingWeb,
                perform: handleUserActivity)
          // register a handler for NSUserActivityTypeBrowsingWeb. iOS invokes this handler when it encounters an App Clip experience URL
         }
    }

    func handleUserActivity(_ userActivity: NSUserActivity) {
      //Process the URL data and check if the URL contains actually any data
        guard
            let incomingURL = userActivity.webpageURL,
            let components = URLComponents(
              url: incomingURL,
              resolvingAgainstBaseURL: true),
            let queryItems = components.queryItems
        else {
            return
        }

      //If there are queryItems named "lat" and "lon" take them and convert them to doubles
        guard
            let latValue = queryItems.first(where: { $0.name == "lat" })?.value,
            let lonValue = queryItems.first(where: { $0.name == "lon" })?.value,
            let lat = Double(latValue),
            let lon = Double(lonValue)
        else {
            return
        }

      //Create a CLLocationCoordinate2D var using the lat and lon
        let location = CLLocationCoordinate2D(
            latitude: CLLocationDegrees(lat),
            longitude: CLLocationDegrees(lon))

      //Query standData to find the stand matching the location
        if let stand = standData.first(where: { $0.coordinate == location }) {
            model.selectedStand = stand
        } else {
            model.locationFound = false
        }

    }
}
