//
//  LemonadeStand.swift
//  SwiftyLemonade
//

import MapKit
import SwiftUI
import LemonadeStandLocations

struct LemonadeStand {
  let id = UUID()
  let title: String
  let coordinate: CLLocationCoordinate2D
  var isFavorite: Bool
  let menu: [Lemonade]
}

extension LemonadeStand: Identifiable { }

let standData = [
  LemonadeStand(
    title: "LA Galaxy",
    coordinate: .dignityHealthSportsPark,
    isFavorite: true,
    menu: fullMenu),
  LemonadeStand(
    title: "Chicago Fire",
    coordinate: .soldierField,
    isFavorite: false,
    menu: fullMenu),
  LemonadeStand(
    title: "Seattle Sounders",
    coordinate: .centuryLinkField,
    isFavorite: false,
    menu: fullMenu),
  LemonadeStand(
    title: "New York City FC",
    coordinate: .yankeeStadium,
    isFavorite: false,
    menu: expressMenu),
  LemonadeStand(
    title: "Los Angeles FC",
    coordinate: .bancOfCalifornia,
    isFavorite: false,
    menu: expressMenu)
]
