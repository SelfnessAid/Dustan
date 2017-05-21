//
//  SignInViewController.swift
//  Dustan
//
//  Created by Mobile Star on 27/04/17.
//  Copyright © 2017 Mobile Star. All rights reserved.
//

import UIKit
import SVProgressHUD

class SignInViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var doorNameBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        doorNameBtn.layer.cornerRadius = 5
        doorNameBtn.layer.borderWidth = 2
        doorNameBtn.layer.borderColor = UIColor.black.cgColor
        doorNameBtn.titleLabel?.textAlignment = NSTextAlignment.center
        passwordTextField.underlined()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func loginBtn_Click(_ sender: Any) {
        SVProgressHUD.show()
        if let phone_number = UserDefaults.standard.string(forKey: "phone_number") {
            DustanService.sharedInstance.signInUser(phone: phone_number, password: self.passwordTextField.text!, onSuccess: { (response) in
                debugPrint(response)
                SVProgressHUD.dismiss()
                if let result = response.result.value as? NSDictionary{
                    if let status = result["status"] as? Bool {
                        if status == true {
                            if let token = result["data"] as? NSDictionary {
                                if let tokenStr = token["token"] as? String {
                                    Constants.token = tokenStr
                                    self.performSegue(withIdentifier: "menuSegue", sender: self)
//                                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                                    let homeVC = storyBoard.instantiateViewController(withIdentifier: "homeVC") as! HomeViewController
//                                    self.navigationController?.pushViewController(homeVC, animated: true)
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
        }else {
            SVProgressHUD.dismiss()
        }
    }
    
    func showAlert(message:String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
