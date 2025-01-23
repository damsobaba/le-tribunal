//
//  Player.swift
//  Le tribunal
//
//  Created by Adam Mabrouki on 23/10/2022.
//

import Foundation
import SwiftUI

protocol Protagonist{
    var name: String { get set }
    var description: String { get set }
    var image: String { get set }
}


struct Player {
    let name: String?
    let image: String?
}


struct Terrorist: Protagonist {
    var name: String = "Terrorist"

    var description: String = "Le terroriste a comme mission de ne pas se faire tirer dessus par le policier au premier tour. Au second tour il doit tous faire pour que l'on vote pour lui"

    var image: String = "terroriste"

}

struct PoliceMan: Protagonist {
    var name: String = "Le policer"

    var description: String = " tu peux buter qqlqun frere"

    var image: String = "policeman"
}

struct Boulanger: Protagonist {
    var name: String

    var description: String

    var image: String


}



struct Card: Identifiable, Hashable, Equatable {
    let id = UUID()
    let protagonist: Protagonist
    let image: UIImage

    // Manual implementation of Equatable
    static func == (lhs: Card, rhs: Card) -> Bool {
        // Compare IDs to determine equality
        return lhs.id == rhs.id
    }

    // Manual implementation of Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
class Deck {
    let cards: [Card] = [
        Card(protagonist: Terrorist(), image: UIImage(named: "terroriste")!),
        Card(protagonist: PoliceMan(), image: UIImage(named: "policeman")!),
        Card(protagonist: Boulanger(name: "Boulanger", description: "Un simple boulanger", image: "boulanger"), image: UIImage(named: "boulanger")!),
    ]
    var drawnCards: [Card] = []

    func draw() -> Card {
        let card = cards.randomElement()!
        drawnCards.append(card)
        return card
    }
}
