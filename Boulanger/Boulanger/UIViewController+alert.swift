//
//  UIViewController+alert.swift
//  Boulanger
//
//  Created by Adam Mabrouki on 11/04/2021.


import UIKit
extension UIViewController {
    ///present allert
    func presentAlertSignal() {
        
        
        
        let alertVC = UIAlertController(title: "Error", message: "you need signal for the application to work", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
    

    func presentAlertNoName() {
        let alertVC = UIAlertController(title: "Error", message: "Please enter a name", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
    func setGradientBackground() {
        let colorTop =  UIColor(red: 255.0/255.0, green: 149.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 1.0).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    
    
  
}

extension String {
    /**
     * Check if a string contains at least one element
     */
    var isBlank: Bool {
        return self.trimmingCharacters(in: .whitespaces) == String() ? true : false
    }
}


