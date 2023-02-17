//
//  ContentView.swift
//  SwiftyLemonade
//

import SwiftUI

struct ContentView: View {
  @State private var hideFavorites = false
  @State var stands = standData

  var body: some View {
    StandTabView()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
