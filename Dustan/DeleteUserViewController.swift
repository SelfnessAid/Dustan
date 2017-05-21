//
//  DeleteUserViewController.swift
//  Dustan
//
//  Created by Mobile Star on 03/03/17.
//  Copyright © 2017 Mobile Star. All rights reserved.
//

import UIKit
import SVProgressHUD

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
        cell.textLabel?.text = "\(indexPath.row + 1)  " + Constants.users[indexPath.row].phone_number
        cell.accessoryType = cell.isSelected ? .checkmark: .none
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoBtn_Click(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "homeVC") as! HomeViewController
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    func getDoor(door_code: String) -> Door {
        for door: Door in Constants.doors {
            if door.code == door_code {
                return door
            }
        }
        return Door()
    }
    
    @IBAction func lockBtn_Click(_ sender: Any) {
        if let doorCode = UserDefaults.standard.string(forKey: "door_code") {
            let door = getDoor(door_code: doorCode)
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let panelVC = storyBoard.instantiateViewController(withIdentifier: "panelVC") as! PanelViewController
            panelVC.door = door
            self.navigationController?.pushViewController(panelVC, animated:true)
        } else {
            let alert = UIAlertController(title: "Notice", message: "You have no selected door now.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func doorNameBtn_Click(_ sender: Any) {
        
    }
    
    func showAlert(title: String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func deleteBtn_Click(_ sender: Any) {
        if UserDefaults.standard.bool(forKey: "GSM") == true {
            showAlert(title: "Error", message: "GSM is blocked now. Please enable it on Administrator")
            return
        }
        
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
