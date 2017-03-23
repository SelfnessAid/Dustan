//
//  DoorListViewController.swift
//  Dustan
//
//  Created by Mobile Star on 02/03/17.
//  Copyright © 2017 Mobile Star. All rights reserved.
//

import UIKit

class DoorListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var logoBtn: UIButton!
    @IBOutlet weak var lockBtn: UIButton!
    @IBOutlet weak var doorNameBtn: UIButton!
    @IBOutlet weak var doorListTableView: UITableView!
    
    var doorList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doorNameBtn.layer.cornerRadius = 5
        doorNameBtn.layer.borderWidth = 2
        doorNameBtn.layer.borderColor = UIColor.black.cgColor
        doorNameBtn.titleLabel?.textAlignment = NSTextAlignment.center
        doorList = ["Front Door", "Back Door", "Rental 1"]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doorList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "doorCell") as! DoorTableViewCell
        cell.noLabel.text = String(indexPath.row + 1)
        cell.doorNameLabel.text = doorList[indexPath.row]
        return cell
    }

    @IBAction func logoBtn_Click(_ sender: Any) {
    }
    @IBAction func lockBtn_Click(_ sender: Any) {
    }
    @IBAction func doorNameBtn_Click(_ sender: Any) {
    }
}
