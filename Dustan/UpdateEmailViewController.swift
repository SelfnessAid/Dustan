//
//  UpdateEmailViewController.swift
//  Dustan
//
//  Created by Mobile Star on 06/03/17.
//  Copyright © 2017 Mobile Star. All rights reserved.
//

import UIKit

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
    @IBAction func logoBtn_Click(_ sender: Any) {
    }
    
    @IBAction func lockBtn_Click(_ sender: Any) {
    }
    @IBAction func doorNameBtn_Click(_ sender: Any) {
    }
    @IBAction func saveBtn_Click(_ sender: Any) {
    }
}
