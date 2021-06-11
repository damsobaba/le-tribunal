//
//  ViewController.swift
//  collectionView
//
//  Created by Adam Mabrouki on 19/04/2021.


import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var labelsss: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "r" else { return }
        if let destination = segue.destination as? NameViewController {
               destination.delegate = self
           }

    }
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {

    }

    @IBAction func GoPressed(_ sender: Any) {

        performSegue(withIdentifier:"r", sender: nil)
    }

}

extension ViewController: addName {
    func fullName(fullName: String) {
        labelsss.text = fullName
    }


//}
