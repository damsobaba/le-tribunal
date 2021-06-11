//
//  ViewController.swift
//  tableViewTest
//
//  Created by Adam Mabrouki on 16/04/2021.
//

import UIKit

class ViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()

        testTableView.register(UINib(nibName: "cell", bundle: nil), forCellReuseIdentifier: "r")
    }


    @IBOutlet weak var testTableView: UITableView!
}
extension ViewController: UITableViewDelegate , UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    } //c
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "r", for: indexPath) as?  testTableViewCell else {
            return UITableViewCell()
        }
       return cell 
    }
    
   
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "Add some favorites in the list"
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textAlignment = .center
        label.textColor = .darkGray
        return label
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}





