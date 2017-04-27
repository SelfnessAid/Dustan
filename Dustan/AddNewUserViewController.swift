//
//  AddNewUserViewController.swift
//  Dustan
//
//  Created by Mobile Star on 03/03/17.
//  Copyright © 2017 Mobile Star. All rights reserved.
//

import UIKit

class AddNewUserViewController: UIViewController {

    @IBOutlet weak var doorNameBtn: UIButton!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        doorNameBtn.layer.cornerRadius = 5
        doorNameBtn.layer.borderWidth = 2
        doorNameBtn.layer.borderColor = UIColor.black.cgColor
        doorNameBtn.titleLabel?.textAlignment = NSTextAlignment.center
        
        firstNameTextField.underlined()
        lastNameTextField.underlined()
        phoneTextField.underlined()
        emailTextField.underlined()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func logoBtn_Click(_ sender: Any) {
        
    }
    
    @IBAction func doorNameBtn_Click(_ sender: Any) {
        
    }
    @IBAction func backBtn_Click(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    func isValidEmail(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    func showAlert(message:String) {
        let alert = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func addBtn_Click(_ sender: Any) {
        if isValidEmail(testStr: emailTextField.text!) == false {
            showAlert(message: "Please enter correct email")
            return
        }
        let alertVC = UIAlertController(title: "Enter the keypad code", message: "", preferredStyle: .alert)
        let OKAct = UIAlertAction(title: "OK", style: .default) { (act) in
            let textField = (alertVC.textFields?[0])! as UITextField
            DustanService.sharedInstance.inviteUser(token: Constants.token, first: self.firstNameTextField.text!, last: self.lastNameTextField.text!, code: textField.text!, phone: self.phoneTextField.text!, email: self.emailTextField.text!, onSuccess: { (response) in
                if let result = response.result.value as? NSDictionary{
                    if let status = result["status"] as? Bool {
                        if status == true {
                            self.showAlert(message: "Added new User successfully")
                        } else {
                            if let message = result["data"] as? String {
                                self.showAlert(message: message)
                                return
                            }
                        }
                    }
                }
            }, onFailure: { (error) in
                self.showAlert(message: error.localizedDescription)
            })
        }
        let CancelAct = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alertVC.addTextField { (textField) in
            
        }
        alertVC.addAction(OKAct)
        alertVC.addAction(CancelAct)
        self.present(alertVC, animated: true, completion: nil)
    }
}

extension UITextField {
    
    func underlined(){
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
