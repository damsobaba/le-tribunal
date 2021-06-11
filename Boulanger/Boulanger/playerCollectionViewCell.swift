//
//  playerCollectionViewCell.swift
//  Boulanger
//
//  Created by Adam Mabrouki on 19/04/2021.
//

import UIKit

class playerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var confilmImage: UIImageView!
    

    var playerDisplay:playersInfo? {
       
        didSet {
           
            nameLabel.text = playerDisplay?.name
        }
    }
    
}
