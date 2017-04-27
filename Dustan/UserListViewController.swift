//
//  UserListViewController.swift
//  Dustan
//
//  Created by Mobile Star on 02/03/17.
//  Copyright © 2017 Mobile Star. All rights reserved.
//

import UIKit
import SVProgressHUD

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
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getUsers()
    }
    
    func processData(data: [NSDictionary]) {
        Constants.users.removeAll()
        for item in data {
            var user: User = User()
            user.id = String(item["id"] as! Int)
            user.first_name = item["first_name"] as! String
            user.last_name = item["last_name"] as! String
            user.phone_number = item["phone_number"] as! String
            Constants.users.append(user)
        }
        
        userTableView.reloadData()
    }
    
    func getUsers() {
        SVProgressHUD.show()
        DustanService.sharedInstance.getUsers(token: Constants.token, onSuccess: { (response) in
            debugPrint(response)
            SVProgressHUD.dismiss()
            if let result = response.result.value as? NSDictionary{
                if let status = result["status"] as? Bool {
                    if status == true {
                        if let users = result["data"] as? [NSDictionary] {
                            self.processData(data: users)
                        }
                    } else {
                        return
                    }
                }
            }
        }) { (error) in
            SVProgressHUD.dismiss()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") as! UserTableViewCell
        cell.noLabel.text = String(indexPath.row + 1)
        cell.nameLabel.text = Constants.users[indexPath.row].first_name + " " + Constants.users[indexPath.row].last_name
        cell.phoneLabel.text = Constants.users[indexPath.row].phone_number
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
    @IBAction func backBtn_Click(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
}
