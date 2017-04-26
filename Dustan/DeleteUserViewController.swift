//
//  DeleteUserViewController.swift
//  Dustan
//
//  Created by Mobile Star on 03/03/17.
//  Copyright © 2017 Mobile Star. All rights reserved.
//

import UIKit

class DeleteUserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var doorNameBtn: UIButton!
    @IBOutlet weak var userTableView: UITableView!
    var users = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()

        doorNameBtn.layer.cornerRadius = 5
        doorNameBtn.layer.borderWidth = 2
        doorNameBtn.layer.borderColor = UIColor.black.cgColor
        doorNameBtn.titleLabel?.textAlignment = NSTextAlignment.center
        
        userTableView.allowsMultipleSelection = true
        
        users = ["User1", "User2", "User3", "User4"]
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "deleteUserCell")! as UITableViewCell
        cell.textLabel?.text = "\(indexPath.row + 1)  " + users[indexPath.row]
        cell.accessoryType = cell.isSelected ? .checkmark: .none
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoBtn_Click(_ sender: Any) {
        
    }
    
    @IBAction func lockBtn_Click(_ sender: Any) {
        
    }
    
    @IBAction func doorNameBtn_Click(_ sender: Any) {
        
    }
    
    @IBAction func deleteBtn_Click(_ sender: Any) {
        
    }
    
    @IBAction func backBtn_Click(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
}
