//
//  UpdatePasswordViewController.swift
//  Dustan
//
//  Created by Mobile Star on 06/03/17.
//  Copyright © 2017 Mobile Star. All rights reserved.
//

import UIKit
import SVProgressHUD

class UpdatePasswordViewController: UIViewController {

    @IBOutlet weak var doorNameBtn: UIButton!
    @IBOutlet weak var oldPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        doorNameBtn.layer.cornerRadius = 5
        doorNameBtn.layer.borderWidth = 2
        doorNameBtn.layer.borderColor = UIColor.black.cgColor
        doorNameBtn.titleLabel?.textAlignment = NSTextAlignment.center
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: oldPasswordTextField.frame.height - 1, width: oldPasswordTextField.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.black.cgColor
        oldPasswordTextField.borderStyle = UITextBorderStyle.none
        oldPasswordTextField.layer.addSublayer(bottomLine)
        
        let bottomLine1 = CALayer()
        bottomLine1.frame = CGRect(x: 0.0, y: newPasswordTextField.frame.height - 1, width: newPasswordTextField.frame.width, height: 1.0)
        bottomLine1.backgroundColor = UIColor.black.cgColor
        newPasswordTextField.borderStyle = UITextBorderStyle.none
        newPasswordTextField.layer.addSublayer(bottomLine1)
        
        let bottomLine2 = CALayer()
        bottomLine2.frame = CGRect(x: 0.0, y: confirmTextField.frame.height - 1, width: confirmTextField.frame.width, height: 1.0)
        bottomLine2.backgroundColor = UIColor.black.cgColor
        confirmTextField.borderStyle = UITextBorderStyle.none
        confirmTextField.layer.addSublayer(bottomLine2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let str = UserDefaults.standard.string(forKey: "door_name") {
            doorNameBtn.setTitle(str, for: .normal)
        }
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
    
    @IBAction func saveBtn_Click(_ sender: Any) {
        if newPasswordTextField.text != confirmTextField.text {
            showAlert(title: "Notice", message: "The passwords do not match")
            return
        }
        
        if UserDefaults.standard.bool(forKey: "GSM") == true {
            showAlert(title: "Notice", message: "GSM is blocked now. Please enable it on Administrator")
            return
        }
        
        SVProgressHUD.show()
        DustanService.sharedInstance.updatePassword(token: Constants.token, old_password: self.oldPasswordTextField.text!, new_password: self.newPasswordTextField.text!, onSuccess: { (response) in
            debugPrint(response)
            SVProgressHUD.dismiss()
            if let result = response.result.value as? NSDictionary{
                if let status = result["status"] as? Bool {
                    if status == true {
                        if (result["data"] as? String) != nil {
                            self.showAlert(title: "Success", message: "Password is updated successfully")
                        }
                    } else {
                        if let message = result["data"] as? String {
                            self.showAlert(title: "Error", message: message)
                            return
                        }
                    }
                }
            }
        }, onFailure: { (error) in
            debugPrint(error)
            SVProgressHUD.dismiss()
            self.showAlert(title: "Error", message: error.localizedDescription)
        })
        
    }
    @IBAction func backBtn_Click(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
}
