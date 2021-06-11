//
//  NameViewController.swift
//  collectionView
//
//  Created by Adam Mabrouki on 21/04/2021.
//

import UIKit
protocol addName:class {
    
    func fullName(fullName:String)
}
class NameViewController: ViewController {

    @IBOutlet weak var nameTextFiz: UITextField!
    
    var delegate: addName?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func okpressed(_ sender: Any) {
        let name = nameTextFiz.text
        delegate?.fullName(fullName: name!)
        dismiss(animated: true, completion: nil)
    }
    
   

}
