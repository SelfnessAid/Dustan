//
//  ManageDoorViewController.swift
//  Dustan
//
//  Created by Mobile Star on 05/03/17.
//  Copyright © 2017 Mobile Star. All rights reserved.
//

import UIKit

class ManageDoorViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var doorNameBtn: UIButton!
    @IBOutlet weak var doorTableView: UITableView!
    
    var doors = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        doorNameBtn.layer.cornerRadius = 5
        doorNameBtn.layer.borderWidth = 2
        doorNameBtn.layer.borderColor = UIColor.black.cgColor
        doorNameBtn.titleLabel?.textAlignment = NSTextAlignment.center
        
        doors = ["Front Door", "Back Door", "Rental"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "doorCell")! as UITableViewCell
        cell.textLabel?.text = "\(indexPath.row + 1)  " + doors[indexPath.row]
        return cell
    }

    @IBAction func logoBtn_Click(_ sender: Any) {
        
    }
    
    @IBAction func lockBtn_Click(_ sender: Any) {
        
    }
    
    @IBAction func doorNameBtn_Click(_ sender: Any) {
        
    }
    
    @IBAction func addDoorBtn_Click(_ sender: Any) {
        performSegue(withIdentifier: "addDoorSegue", sender: nil)
    }
    
    @IBAction func deleteDoorBtn_Click(_ sender: Any) {
        performSegue(withIdentifier: "deleteDoorSegue", sender: nil)
    }

}
