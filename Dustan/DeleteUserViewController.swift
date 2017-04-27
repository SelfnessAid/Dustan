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
        
        userTableView.allowsMultipleSelection = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "deleteUserCell")! as UITableViewCell
        cell.textLabel?.text = "\(indexPath.row + 1)  " + Constants.users[indexPath.row].first_name + Constants.users[indexPath.row].last_name
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
    
    func showAlert(title: String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func deleteBtn_Click(_ sender: Any) {
        let alertVC = UIAlertController(title: "Enter the keypad code", message: "", preferredStyle: .alert)
        let OKAct = UIAlertAction(title: "OK", style: .default) { (act) in
            let textField = (alertVC.textFields?[0])! as UITextField
            DustanService.sharedInstance.deleteUser(token: Constants.token, code: textField.text!, phone: Constants.users[(self.userTableView.indexPathForSelectedRow?.row)!].phone_number, onSuccess: { (response) in
                if let result = response.result.value as? NSDictionary{
                    if let status = result["status"] as? Bool {
                        if status == true {
                            self.showAlert(title: "Success", message: "deleted User successfully")
                        } else {
                            if let message = result["data"] as? String {
                                self.showAlert(title: "Error", message: message)
                                return
                            }
                        }
                    }
                }
            }, onFailure: { (error) in
                self.showAlert(title: "Error", message: error.localizedDescription)
            })
        }
        let CancelAct = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alertVC.addTextField { (textField) in
            
        }
        alertVC.addAction(OKAct)
        alertVC.addAction(CancelAct)
        self.present(alertVC, animated: true, completion: nil)
    }
    
    @IBAction func backBtn_Click(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
}
