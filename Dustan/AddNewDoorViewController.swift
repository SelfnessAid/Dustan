//
//  AddNewDoorViewController.swift
//  Dustan
//
//  Created by Mobile Star on 02/03/17.
//  Copyright © 2017 Mobile Star. All rights reserved.
//

import UIKit
import SVProgressHUD

class AddNewDoorViewController: UIViewController {
    @IBOutlet weak var lockBtn: UIButton!
    @IBOutlet weak var logoBtn: UIButton!
    @IBOutlet weak var doorNameBtn: UIButton!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var doorNameText: UITextField!
    @IBOutlet weak var doorPhoneNoTextField: UITextField!
    @IBOutlet weak var doorCodeTextField: UITextField!
    @IBOutlet weak var mobileNoTextField: UITextField!
    @IBOutlet weak var appPasswordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialize()
        
        self.doorNameText.text = "New Door"
        self.doorPhoneNoTextField.text = "+442071234567"
        self.doorCodeTextField.text = "12341234"
        self.appPasswordTextField.text = "password"
        self.emailTextField.text = "man@test.com"
    }
    
    func initialize() {
        doorNameBtn.layer.cornerRadius = 5
        doorNameBtn.layer.borderWidth = 2
        doorNameBtn.layer.borderColor = UIColor.black.cgColor
        doorNameBtn.titleLabel?.textAlignment = NSTextAlignment.center
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: doorNameText.frame.height - 1, width: doorNameText.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.black.cgColor
        doorNameText.borderStyle = UITextBorderStyle.none
        doorNameText.layer.addSublayer(bottomLine)
        
        let bottomLine1 = CALayer()
        bottomLine1.frame = CGRect(x: 0.0, y: doorPhoneNoTextField.frame.height - 1, width: doorPhoneNoTextField.frame.width, height: 1.0)
        bottomLine1.backgroundColor = UIColor.black.cgColor
        doorPhoneNoTextField.borderStyle = UITextBorderStyle.none
        doorPhoneNoTextField.layer.addSublayer(bottomLine1)
        
        let bottomLine2 = CALayer()
        bottomLine2.frame = CGRect(x: 0.0, y: doorCodeTextField.frame.height - 1, width: doorCodeTextField.frame.width, height: 1.0)
        bottomLine2.backgroundColor = UIColor.black.cgColor
        doorCodeTextField.borderStyle = UITextBorderStyle.none
        doorCodeTextField.layer.addSublayer(bottomLine2)
        
        let bottomLine3 = CALayer()
        bottomLine3.frame = CGRect(x: 0.0, y: appPasswordTextField.frame.height - 1, width: appPasswordTextField.frame.width, height: 1.0)
        bottomLine3.backgroundColor = UIColor.black.cgColor
        appPasswordTextField.borderStyle = UITextBorderStyle.none
        appPasswordTextField.layer.addSublayer(bottomLine3)
        
        let bottomLine4 = CALayer()
        bottomLine4.frame = CGRect(x: 0.0, y: emailTextField.frame.height - 1, width: emailTextField.frame.width, height: 1.0)
        bottomLine4.backgroundColor = UIColor.black.cgColor
        emailTextField.borderStyle = UITextBorderStyle.none
        emailTextField.layer.addSublayer(bottomLine4)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtn_Click(_ sender: Any) {
        self.navigationController!.popViewController(animated: true)
    }
    
    @IBAction func lockBtn_Click(_ sender: Any) {
        
    }
    
    @IBAction func logoBtn_Click(_ sender: Any) {
        
    }
    
    @IBAction func doorNameBtn_Click(_ sender: Any) {
        
    }
    
    @IBAction func addBtn_Click(_ sender: Any) {
        
        let nameStr: String = self.doorNameText.text!
        let phoneStr: String = self.doorPhoneNoTextField.text!
        let codeStr: String = self.doorCodeTextField.text!
        let passwordStr: String = self.appPasswordTextField.text!
        let emailStr: String = self.emailTextField.text!
        
        if nameStr.isEmpty || phoneStr.isEmpty || codeStr.isEmpty || passwordStr.isEmpty || emailStr.isEmpty {
            self.showAlert(message: "Please fill in all fields!")
            return
        }
        if !isValidEmail(testStr: emailStr) {
            self.showAlert(message: "Input Valid Email Address!")
            return
        }
//        self.performSegue(withIdentifier: "securityQestionsSegue", sender: self)
        SVProgressHUD.show()
        
        DustanService.sharedInstance.addNewDoor(name: nameStr, phone: phoneStr, code: codeStr, password: passwordStr, email: emailStr, onSuccess: { (response) in
            debugPrint(response)
            SVProgressHUD.dismiss()
            if let result = response.result.value as? NSDictionary{
                if let status = result["status"] as? Bool {
                    if status == true {
                        if let token = result["data"] as? NSDictionary {
                            if let tokenStr = token["token"] as? String {
                                Constants.token = tokenStr
                                if UserDefaults.standard.bool(forKey: "loggedIn") == false {
                                    self.performSegue(withIdentifier: "securityQestionsSegue", sender: self)
                                } else {
                                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                                    let homeVC = storyBoard.instantiateViewController(withIdentifier: "homeVC") as! HomeViewController
                                    self.navigationController?.pushViewController(homeVC, animated:true)
                                }
                            }
                            
                        }
                    } else {
                        if let message = result["data"] as? String {
                            self.showAlert(message: message)
                            return
                        }
                    }
                }
            }
        }, onFailure: { (error) in
            debugPrint(error)
            SVProgressHUD.dismiss()
            self.showAlert(message: error.localizedDescription)
        })
    }
    
    func showAlert(message:String) {
        let alert = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func isValidEmail(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
}
