//
//  UpdateEmailViewController.swift
//  Dustan
//
//  Created by Mobile Star on 06/03/17.
//  Copyright © 2017 Mobile Star. All rights reserved.
//

import UIKit
import SVProgressHUD

class UpdateEmailViewController: UIViewController {

    @IBOutlet weak var doorNameBtn: UIButton!
    @IBOutlet weak var oldEmailTextField: UITextField!
    @IBOutlet weak var newEmailTextField: UITextField!
    @IBOutlet weak var confirmTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        doorNameBtn.layer.cornerRadius = 5
        doorNameBtn.layer.borderWidth = 2
        doorNameBtn.layer.borderColor = UIColor.black.cgColor
        doorNameBtn.titleLabel?.textAlignment = NSTextAlignment.center
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: oldEmailTextField.frame.height - 1, width: oldEmailTextField.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.black.cgColor
        oldEmailTextField.borderStyle = UITextBorderStyle.none
        oldEmailTextField.layer.addSublayer(bottomLine)
        
        let bottomLine1 = CALayer()
        bottomLine1.frame = CGRect(x: 0.0, y: newEmailTextField.frame.height - 1, width: newEmailTextField.frame.width, height: 1.0)
        bottomLine1.backgroundColor = UIColor.black.cgColor
        newEmailTextField.borderStyle = UITextBorderStyle.none
        newEmailTextField.layer.addSublayer(bottomLine1)
        
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
    
    @IBAction func logoBtn_Click(_ sender: Any) {
        
    }
    
    @IBAction func lockBtn_Click(_ sender: Any) {
        
    }
    
    @IBAction func doorNameBtn_Click(_ sender: Any) {
        
    }
    
    @IBAction func saveBtn_Click(_ sender: Any) {
        if isValidEmail(testStr: oldEmailTextField.text!) == false || isValidEmail(testStr: newEmailTextField.text!) == false {
            showAlert(message: "")
            return
        }
        
        if newEmailTextField.text != confirmTextField.text {
            showAlert(message: "")
            return
        }
        
        SVProgressHUD.show()
        DustanService.sharedInstance.updateEmail(token: Constants.token, old_email: self.oldEmailTextField.text!, new_email: self.newEmailTextField.text!, onSuccess: { (response) in
            debugPrint(response)
            SVProgressHUD.dismiss()
            if let result = response.result.value as? NSDictionary{
                if let status = result["status"] as? Bool {
                    if status == true {
                        if (result["data"] as? String) != nil {
                            self.showAlert(message: "Email Address is updated successfully")
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
    @IBAction func backBtn_Click(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
}
