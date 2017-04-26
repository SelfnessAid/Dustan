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
    @IBOutlet weak var userPhoneTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        doorNameBtn.layer.cornerRadius = 5
        doorNameBtn.layer.borderWidth = 2
        doorNameBtn.layer.borderColor = UIColor.black.cgColor
        doorNameBtn.titleLabel?.textAlignment = NSTextAlignment.center
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: userPhoneTextField.frame.height - 1, width: userPhoneTextField.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.black.cgColor
        userPhoneTextField.borderStyle = UITextBorderStyle.none
        userPhoneTextField.layer.addSublayer(bottomLine)
        
        let bottomLine1 = CALayer()
        bottomLine1.frame = CGRect(x: 0.0, y: userNameTextField.frame.height - 1, width: userNameTextField.frame.width, height: 1.0)
        bottomLine1.backgroundColor = UIColor.black.cgColor
        userNameTextField.borderStyle = UITextBorderStyle.none
        userNameTextField.layer.addSublayer(bottomLine1)
        
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
}
