//
//  Lemonade.swift
//  SwiftyLemonade
//

import Foundation

struct Lemonade {
  let id = UUID()
  let title: String
  let imageName: String
  let calories: Int
}

extension Lemonade: Identifiable { }

let fullMenu = [
  Lemonade(
    title: "Lemon",
    imageName: "lemon",
    calories: 120),
  Lemonade(
    title: "Lime",
    imageName: "lime",
    calories: 120),
  Lemonade(
    title: "Watermelon",
    imageName: "watermelon",
    calories: 110),
  Lemonade(
    title: "Frozen Lemon",
    imageName: "lemon",
    calories: 140),
  Lemonade(
    title: "Frozen Lime",
    imageName: "lime",
    calories: 140),
  Lemonade(
    title: "Frozen Watermelon",
    imageName: "watermelon",
    calories: 110)
]

let expressMenu = [
  Lemonade(
    title: "Lemon",
    imageName: "lemon",
    calories: 120),
  Lemonade(
    title: "Lime",
    imageName: "lime",
    calories: 120),
  Lemonade(
    title: "Watermelon",
    imageName: "watermelon",
    calories: 110)
]
