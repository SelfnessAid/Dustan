//
//  UpdatePasswordViewController.swift
//  Dustan
//
//  Created by Mobile Star on 06/03/17.
//  Copyright © 2017 Mobile Star. All rights reserved.
//

import UIKit

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
    
    @IBAction func logoBtn_Click(_ sender: Any) {
    }
    @IBAction func lockBtn_Click(_ sender: Any) {
    }
    @IBAction func doorNameBtn_Click(_ sender: Any) {
    }
    @IBAction func saveBtn_Click(_ sender: Any) {
    }
}
