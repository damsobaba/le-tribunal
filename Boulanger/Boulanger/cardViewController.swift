//
//  cardViewController.swift
//  Boulanger
//
//  Created by Adam Mabrouki on 07/04/2021.
//

import UIKit

// trouver le moyen dimplementer une classe player pour lui reatribuer des donees a chaaque fois que l'on click sur une cell de la tab de la tableview

var img = [Terrorist().imageName, Cartel().imageName, FisherGirl().imageName]

class cardViewController: UIViewController {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cardNameLabel: UILabel!
    
    @IBOutlet weak var infoButton: UIButton!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var playerCard:playersInfo?
    
    
    //  var playerCard: playerCard?
    
    var imageArr:[String] = []
    
    var imageOfPlayer = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adjustView()
        
        //        getRamdomcard()
        setGradientBackground()
        displayCard()
    }
    
    
    func adjustView() {
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 40
        descriptionLabel.layer.cornerRadius = 40
        descriptionLabel.clipsToBounds = true
        
    }
    func displayCard() {
        
        imageView.image = UIImage(named:(playerCard?.image)!)
        descriptionLabel.text =  playerCard?.caractherDescription
        cardNameLabel.text = playerCard?.charachterName
    }
    
    //    func getRamdomcard()  {
    //        if img.isEmpty == false {
    //        let randomNumber = Int(arc4random_uniform(UInt32(img.count)))
    //        let image = UIImage.init(named: "\(img[randomNumber])")
    //
    //     img.remove(at: randomNumber)
    //
    //        print(img)
    //        imageView.image = image
    //
    //        getTheRightNameLabel()
    //        } else {
    //      return
    //        }
    //    }
    
    
    // get the name under the correspnding image
    //    func getTheRightNameLabel() {
    //        switch imageView.image {
    //        case UIImage(named: "cartel"):
    //            cardNameLabel.text = "The Cartel"
    //            descriptionLabel.text = player?.caractherDescription
    //        case UIImage(named: "terroriste"):
    //            cardNameLabel.text = "The terrorist"
    //            descriptionLabel.text = Characters().terrorist
    //        case UIImage(named: "poisson"):
    //            cardNameLabel.text = "The fisher girl"
    //            descriptionLabel.text = Characters().fisherGirl
    //        case UIImage(named: "boulanger"):
    //            cardNameLabel.text = "The boulanger"
    //            descriptionLabel.text = Characters().boulanger
    //
    //
    //        default: break
    //        }
    //    }
    
    
    
    @IBAction func infoButtonTapped(_ sender: UIButton) {
        if sender.isSelected == false {
            sender.isSelected = true
            imageView.isHidden = true
            descriptionLabel.isHidden = false
        }else {
            sender.isSelected = false
            imageView.isHidden = false
            descriptionLabel.isHidden = true
        }
    }
    
    
    
    @IBAction func backBtnDidTap(_ sender: Any) {
        self.performSegue(withIdentifier: "unwindToViewController1", sender: self)
        
        
    }
    
}

