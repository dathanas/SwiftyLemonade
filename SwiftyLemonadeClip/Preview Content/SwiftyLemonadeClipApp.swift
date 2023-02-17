//
//  SwiftyLemonadeClipApp.swift
//  SwiftyLemonadeClip
//

import SwiftUI
import CoreLocation

@main
struct SwiftyLemonadeClipApp: App {
    @StateObject private var model = SwiftyLemonadeClipModel()
  
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
              .environmentObject(model)
              .onContinueUserActivity(
                NSUserActivityTypeBrowsingWeb,
                perform: handleUserActivity)
         }
    }

    func handleUserActivity(_ userActivity: NSUserActivity) {
        guard
            let incomingURL = userActivity.webpageURL,
            let components = URLComponents(
              url: incomingURL,
              resolvingAgainstBaseURL: true),
            let queryItems = components.queryItems
        else {
            return
        }

        guard
            let latValue = queryItems.first(where: { $0.name == "lat" })?.value,
            let lonValue = queryItems.first(where: { $0.name == "lon" })?.value,
            let lat = Double(latValue),
            let lon = Double(lonValue)
        else {
            return
        }

        let location = CLLocationCoordinate2D(
            latitude: CLLocationDegrees(lat),
            longitude: CLLocationDegrees(lon))

        if let stand = standData.first(where: { $0.coordinate == location }) {
            model.selectedStand = stand
            print("Welcome to \(stand.title)! :]")
        } else {
            model.locationFound = false
        }

    }


}
