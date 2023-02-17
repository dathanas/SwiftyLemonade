//
//  MenuList.swift
//  SwiftyLemonade
//

import SwiftUI

struct MenuList: View {
  let stand: LemonadeStand

  var body: some View {
    List(stand.menu, id: \.id) { item in
      NavigationLink(
        destination: DetailView(lemonade: item)) {
        Text(item.title)
      }
    }.navigationTitle(stand.title)
  }
}

struct MenuList_Previews: PreviewProvider {
  static var previews: some View {
    MenuList(stand: standData[0])
  }
}
