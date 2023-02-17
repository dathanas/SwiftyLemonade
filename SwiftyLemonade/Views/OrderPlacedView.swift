//
//  OrderPlacedView.swift
//  SwiftyLemonade
//

import SwiftUI

struct OrderPlacedView: View {
  let lemonade: Lemonade

  var body: some View {
    VStack {
      Image(lemonade.imageName)
        .resizable()
        .frame(maxWidth: 300, maxHeight: 600)
        .aspectRatio(contentMode: .fit)
      Text("Thank you!\nYour Lemonade is on its way!")
        .lineLimit(2)
        .multilineTextAlignment(.center)
        .padding(15)
    }
  }
}

struct OrderPlacedView_Previews: PreviewProvider {
  static var previews: some View {
    OrderPlacedView(lemonade: standData[0].menu[0])
  }
}
