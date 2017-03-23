//
//  PasswordViewController.swift
//  Dustan
//
//  Created by Mobile Star on 08/03/17.
//  Copyright © 2017 Mobile Star. All rights reserved.
//

import UIKit

class PasswordViewController: UIViewController {

    @IBOutlet weak var doorNameBtn: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        doorNameBtn.layer.cornerRadius = 5
        doorNameBtn.layer.borderWidth = 2
        doorNameBtn.layer.borderColor = UIColor.black.cgColor
        doorNameBtn.titleLabel?.textAlignment = NSTextAlignment.center
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: passwordTextField.frame.height - 1, width: passwordTextField.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.black.cgColor
        passwordTextField.borderStyle = UITextBorderStyle.none
        passwordTextField.layer.addSublayer(bottomLine)
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
    @IBAction func forgetPasswordBtn_Click(_ sender: Any) {
    }
    @IBAction func goBtn_Click(_ sender: Any) {
        performSegue(withIdentifier: "newDoorSegue", sender: nil)
    }
}
