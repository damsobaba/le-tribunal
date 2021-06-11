//
//  cardsDescription.swift
//  Boulanger
//
//  Created by Adam Mabrouki on 23/04/2021.
//

import Foundation
import UIKit





struct playersInfo {
    var name: String?
    var charachterName:String?
    var caractherDescription:String?
    var image: String?
}
 

struct playerDisplay {
    let player: [Player]
}



struct Player {
    var charachterName:String
    var caractherDescription:String?
    var image: String?
   
}




struct Terrorist{
    var name = "terroriste"
    var description = "Le terroriste a comme mission de ne pas se faire tirer dessus par le policier au premier tour. Au second tour il doit tous faire pour que l'on vote pour lui"
    var imageName = "terroriste"
    
}

class Cartel {
    var name = "cartel"
    var description = "Le terroriste a comme mission de ne pas se faire tirer dessus par le policier au premier tour. Au second tour il doit tous faire pour que l'on vote pour lui"
    var imageName = "cartel"
    
}

class FisherGirl {
    
    var description = "Le terroriste a comme mission de ne pas se faire tirer dessus par le policier au premier tour. Au second tour il doit tous faire pour que l'on vote pour lui"
    var imageName = "poisson"
    
}



struct Characters{
    var name:String?
    var description:String?
    var image:String?
    
}

class playerCard {
    var cardName: String?
    var cardDescription:String?
    var cardImage: UIImage?
}
