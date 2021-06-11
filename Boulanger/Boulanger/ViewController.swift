//
//  ViewController.swift
//  Boulanger
//
//  Created by Adam Mabrouki on 07/04/2021.
//

import UIKit


protocol AddContactDelegate {
    func addContact(contact: playersInfo)
}


class ViewController: UIViewController,  UITextFieldDelegate{
    
    @IBOutlet weak var nameTexField: UITextField!
    @IBOutlet weak var hideTHePhoneLabel: UILabel!
    @IBOutlet weak var decriptionLabel: UILabel!
    @IBOutlet weak var coundownLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    var delegate: AddContactDelegate?
    
    var playerCard:playersInfo?
    
    var players: playersInfo?
    
    
    private var coreDataManager: CoreDataManager?
  
    var timeRemaining: Int = 3
    var timer: Timer!
    
    
    // Method to dissmiss keyboard when user tap on "done"
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTexField.resignFirstResponder()
        return true
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        playButton.clipsToBounds = true
        playButton.layer.cornerRadius = 20
        
    }
    
    @IBAction func goback(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func playButtonTapped(_ sender: Any) {
        saveNameToFirstVc()
        if nameTexField.text?.isBlank == false{
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(step), userInfo: nil, repeats:true )
        hideTHePhoneLabel.isHidden = false
        decriptionLabel.isHidden = true
        } 
    }
    
    
    func saveNameToFirstVc() {
        
        // passe de data avec closure
//        if let vc =  presentingViewController as? PlayersViewController {
//            vc.setName(n: nameTexField.text!)
//            vc.plusImage.isHidden = true
//            vc.nameLabel.isHidden = false
//            vc.collectionView
//            vc.players = players
//        }
        guard let name = nameTexField.text , !name.isBlank else {
            presentAlertNoName()
            return }
        
        let contact = playersInfo(name: name)
                
                delegate?.addContact(contact: contact)
    }
    
    
//    private func savePlayerName() {
//        guard let name = nameTexField.text , !name.isBlank else {
//            presentAlertNoName()
//            return }
//        coreDataManager?.createPlayer(name: name)
//         let playerInfos = playersInfo(name: name)
//         players = playerInfos
//
//    }
    
    @objc func step() {
        if timeRemaining > 0 {
            timeRemaining -= 1
        }else {
            timer.invalidate()
            timeRemaining = 3
        }
        if timeRemaining == 0 {
            presentNextVC()
        }
        coundownLabel.text = "\(timeRemaining)"
    }
    
    
    func presentNextVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let detailVC = storyboard.instantiateViewController(withIdentifier:"cardViewController") as! cardViewController
//
      detailVC.playerCard = playerCard
        
        self.navigationController?.pushViewController(detailVC, animated: true)
        self.present(detailVC, animated: true, completion: nil)
    }
}

