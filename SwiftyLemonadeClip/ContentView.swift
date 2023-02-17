//
//  ContentView.swift
//  SwiftyLemonadeClip
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
  
    @EnvironmentObject private var model: SwiftyLemonadeClipModel

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        if let selectedStand = model.selectedStand {
            NavigationView {
                MenuList(stand: selectedStand)
            }
        }
      
        if model.locationFound == false {
            Text("Error finding stand.")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
