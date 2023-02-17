//
//  StandList.swift
//  SwiftyLemonade
//

import SwiftUI

struct StandList: View {
  @Binding var stands: [LemonadeStand]
  let tabTitle: String
  let hideFav: Bool

  var showFav: [LemonadeStand] {
    hideFav ? stands.filter { $0.isFavorite == true } : stands
  }

  private func setFavorite(_ favorite: Bool, for stand: LemonadeStand) {
    if let index = stands.firstIndex(
      where: { $0.id == stand.id }) {
      stands[index].isFavorite = favorite
    }
  }

  var body: some View {
    List(showFav) { stand in
      NavigationLink(
        destination: MenuList(stand: stand)) {
        Label(
          "\(stand.title)",
          systemImage: stand.isFavorite ? "heart.fill": "heart")
          .contextMenu {
            Button("Like") {
              setFavorite(true, for: stand)
            }
            Button("Unlike") {
              setFavorite(false, for: stand)
            }
          }
      }
    }
    .navigationBarTitle(tabTitle)
  }
}
