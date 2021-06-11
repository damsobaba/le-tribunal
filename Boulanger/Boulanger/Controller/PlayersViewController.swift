//
//  PlayersViewController.swift
//  Boulanger
//
//  Created by Adam Mabrouki on 10/04/2021.
//

import UIKit



class PlayersViewController: UIViewController {
   
    var players = [playersInfo]()
    
    var playerCard:playersInfo? // voir pour faire comme le premonm mettre en mode tableau
    
    
    
    // display witch player has to pick a card
    var playersNumbers: Int = 1
    
    // to know how many players are ready to play
    var numberOfplayer: Int = 0
    
    @IBOutlet weak var numberOfplayerLabel: UILabel!
    
    
    @IBOutlet weak var playerNumberLabel: UILabel!
    @IBOutlet weak var player1View: UIView!
    @IBOutlet weak var plusImage: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
  
    
    
    

    private var coreDataManager: CoreDataManager?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        player1View.layer.cornerRadius = 10
        
    
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let coredataStack = appdelegate.coreDataStack
        coreDataManager = CoreDataManager(coreDataStack: coredataStack)
        collectionView.backgroundColor = nil
        collectionView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(true)
    }
    
    func displayNextPlayerToPickAcard() {
        playersNumbers += 1
        playerNumberLabel.text = "Player\(playersNumbers)"
    }
    
    // passe de data avec closure
//    func setName(n:String) {
//        nameLabel.text = n
//    }
//
    func affectRamdomPlayer() {
        let cards = [Characters(name: "terroriste", description: "Le terroriste a comme mission de ne pas se faire tirer dessus par le policier au premier tour. Au second tour il doit tous faire pour que l'on vote pour lui", image: "terroriste"),Characters(name: "cartel", description: "description du cartel", image: "cartel")]
        
        
        guard let ramdomCard = cards.randomElement() else { return }
        print(ramdomCard.name as Any)
        
        /// test pour mettre toute les infos dans un tableau
    //        playerCard?.caractherDescription?.append(ramdomCard.name!)
    //        playerCard?.charachterName.append(ramdomCard.description!)
    //        playerCard?.image?.append(ramdomCard.image!)
//        playerCard?.append(Player(charachterName: ramdomCard.name!, caractherDescription: ramdomCard.description!, image: ramdomCard.image!))
//
        
//        playerCard?.append(playersInfo(name: "nn", charachterName: ramdomCard.name!, caractherDescription: ramdomCard.description!, image: ramdomCard.image!))
////        playerCard =  Player(charachterName: ramdomCard.name!, caractherDescription: ramdomCard.description!, image: ramdomCard.image!)

        playerCard = playersInfo(name: "nn", charachterName: ramdomCard.name!, caractherDescription: ramdomCard.description!, image: ramdomCard.image!)
        
    }
    
 

   
    @IBAction func slideNumberOfPlayer(_ sender: UISlider) {
        numberOfplayerLabel.text = String(Int(sender.value))
//        players.numbers = Int(sender.value)
//        t?.numbers = Int(sender.value)
        
    }
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "vc" else { return }
        affectRamdomPlayer()
        if let destination = segue.destination as? ViewController {
               destination.delegate = self
            destination.playerCard = playerCard
           }
        
      
        displayNextPlayerToPickAcard()
    }
    
    
    
}

extension PlayersViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return players.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "r", for: indexPath) as? playerCollectionViewCell else {
            return UICollectionViewCell()
            }
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
    
        cell.nameLabel.text = players[indexPath.row].name
         return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
       {
          return CGSize(width: 100.0, height: 100.0)
       }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let player = playerCard
      
//        performSegue(withIdentifier:"vc", sender: nil)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "cardViewController") as! cardViewController
        
        let description = player?.caractherDescription
        let image = player?.image
        let name = player?.charachterName
//        let playerDisplay = Player(charachterName: name!, caractherDescription: description, image: image)
        let playerDisplay = playersInfo(name: "gg", charachterName: name, caractherDescription: description, image: image)
        
        
        detailVC.playerCard = playerDisplay
//        detailVC.nameLabel.text = players
        
        self.navigationController?.pushViewController(detailVC, animated: true)
        self.present(detailVC, animated: true, completion: nil)
    }
}


extension PlayersViewController: AddContactDelegate {
  
    func addContact(contact: playersInfo) {
        self.players.append(contact)
            print(self.players.count)
            self.collectionView.reloadData()
    }
}


// pourquoi tout les cellules =  meme joueur?
// theorie de recipleaser faire des tableaux?
// faire des recherchres sur des collection view personalisé
// metre du son
// mettre un bouton lorsque que l on clique sur la collection view? ou juste mettre une pop up avant d'afficher la carte
