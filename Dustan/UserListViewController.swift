//
//  UserListViewController.swift
//  Dustan
//
//  Created by Mobile Star on 02/03/17.
//  Copyright © 2017 Mobile Star. All rights reserved.
//

import UIKit

class UserListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var doorNameBtn: UIButton!
    @IBOutlet weak var userTableView: UITableView!
    
    var userList = [String]()
    var phoneList = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()

        doorNameBtn.layer.cornerRadius = 5
        doorNameBtn.layer.borderWidth = 2
        doorNameBtn.layer.borderColor = UIColor.black.cgColor
        doorNameBtn.titleLabel?.textAlignment = NSTextAlignment.center
        userList = ["David", "David", "David"]
        phoneList = ["07835 781104", "07835 781104", "07835 781104"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") as! UserTableViewCell
        cell.noLabel.text = String(indexPath.row + 1)
        cell.nameLabel.text = userList[indexPath.row]
        cell.phoneLabel.text = phoneList[indexPath.row]
        return cell
    }


    @IBAction func logoBtn_Click(_ sender: Any) {
    }

    @IBAction func lockBtn_Click(_ sender: Any) {
        
    }
    
    @IBAction func doorNameBtn_Click(_ sender: Any) {
        
    }
    
    @IBAction func newUserBtn_Click(_ sender: Any) {
        performSegue(withIdentifier: "addNewUserSegue", sender: nil)
    }
    
    @IBAction func deleteUserBtn_Click(_ sender: Any) {
        performSegue(withIdentifier: "deleteUserSegue", sender: nil)
        
    }
}
