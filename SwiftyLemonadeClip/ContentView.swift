//
//  ContentView.swift
//  SwiftyLemonadeClip
//

import SwiftUI
import CoreData

struct ContentView: View {
    @EnvironmentObject private var model: SwiftyLemonadeClipModel

    var body: some View {
      //Check if there is a selectedStand and if true add tha MenuList view as the root view
        if let selectedStand = model.selectedStand {
            NavigationView {
                MenuList(stand: selectedStand)
            }
        }
      
      //If there is no stand in the location just show the user a message
        if model.locationFound == false {
            Text("Error finding stand.")
        }

    }
}
