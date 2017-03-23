//
//  SecurityQuestionViewController.swift
//  Dustan
//
//  Created by Mobile Star on 08/03/17.
//  Copyright © 2017 Mobile Star. All rights reserved.
//

import UIKit

class SecurityQuestionViewController: UIViewController {

    @IBOutlet weak var doorNameBtn: UIButton!
    @IBOutlet weak var question1Btn: UIButton!
    @IBOutlet weak var question2Btn: UIButton!
    @IBOutlet weak var question3Btn: UIButton!
    @IBOutlet weak var answer1TextField: UITextField!
    @IBOutlet weak var answer2TextField: UITextField!
    @IBOutlet weak var answer3TextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        doorNameBtn.layer.cornerRadius = 5
        doorNameBtn.layer.borderWidth = 2
        doorNameBtn.layer.borderColor = UIColor.black.cgColor
        doorNameBtn.titleLabel?.textAlignment = NSTextAlignment.center
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: answer1TextField.frame.height - 1, width: answer1TextField.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.black.cgColor
        answer1TextField.borderStyle = UITextBorderStyle.none
        answer1TextField.layer.addSublayer(bottomLine)
        
        let bottomLine1 = CALayer()
        bottomLine1.frame = CGRect(x: 0.0, y: answer2TextField.frame.height - 1, width: answer2TextField.frame.width, height: 1.0)
        bottomLine1.backgroundColor = UIColor.black.cgColor
        answer2TextField.borderStyle = UITextBorderStyle.none
        answer2TextField.layer.addSublayer(bottomLine1)
        
        let bottomLine2 = CALayer()
        bottomLine2.frame = CGRect(x: 0.0, y: answer3TextField.frame.height - 1, width: answer3TextField.frame.width, height: 1.0)
        bottomLine2.backgroundColor = UIColor.black.cgColor
        answer3TextField.borderStyle = UITextBorderStyle.none
        answer3TextField.layer.addSublayer(bottomLine2)
        
        question1Btn.layer.borderWidth = 1
        question1Btn.layer.cornerRadius = 5
        question1Btn.titleEdgeInsets = UIEdgeInsetsMake(0.0, 20.0, 0.0, 0.0)
        
        question2Btn.layer.borderWidth = 1
        question2Btn.layer.cornerRadius = 5
        question2Btn.titleEdgeInsets = UIEdgeInsetsMake(0.0, 20.0, 0.0, 0.0)
        
        question3Btn.layer.borderWidth = 1
        question3Btn.layer.cornerRadius = 5
        question3Btn.titleEdgeInsets = UIEdgeInsetsMake(0.0, 20.0, 0.0, 0.0)
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
    
    @IBAction func question1Btn_Click(_ sender: Any) {
    }
    
    @IBAction func question2Btn_Click(_ sender: Any) {
    }
    
    @IBAction func question3Btn_Click(_ sender: Any) {
    }
    
    @IBAction func continueBtn_Click(_ sender: Any) {
        performSegue(withIdentifier: "userTypeSegue", sender: nil)
    }
}
