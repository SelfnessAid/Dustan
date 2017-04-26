//
//  SecurityQuestionViewController.swift
//  Dustan
//
//  Created by Mobile Star on 08/03/17.
//  Copyright © 2017 Mobile Star. All rights reserved.
//

import UIKit
import SVProgressHUD
import DropDown

class SecurityQuestionViewController: UIViewController {

    @IBOutlet weak var doorNameBtn: UIButton!
    @IBOutlet weak var question1Btn: UIButton!
    @IBOutlet weak var question2Btn: UIButton!
    @IBOutlet weak var question3Btn: UIButton!
    @IBOutlet weak var answer1TextField: UITextField!
    @IBOutlet weak var answer2TextField: UITextField!
    @IBOutlet weak var answer3TextField: UITextField!
    
    let first_drop = DropDown()
    let second_drop = DropDown()
    let third_drop = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        getQuestions()
    }
    
    func initUI() {
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
        question1Btn.titleEdgeInsets = UIEdgeInsetsMake(0.0, 20.0, 0.0, 20.0)
        
        question2Btn.layer.borderWidth = 1
        question2Btn.layer.cornerRadius = 5
        question2Btn.titleEdgeInsets = UIEdgeInsetsMake(0.0, 20.0, 0.0, 20.0)
        
        question3Btn.layer.borderWidth = 1
        question3Btn.layer.cornerRadius = 5
        question3Btn.titleEdgeInsets = UIEdgeInsetsMake(0.0, 20.0, 0.0, 20.0)
        
        first_drop.anchorView = question1Btn.plainView
        second_drop.anchorView = question2Btn.plainView
        third_drop.anchorView = question3Btn.plainView
    }
    
    func processData(data: [NSDictionary]) {
        var datas = [String]()
        for item in data {
            var question: Question = Question()
            question.id = String(item["id"] as! Int)
            question.question = item["question"] as! String
            datas.append(question.question)
            Constants.questions.append(question)
        }
        
        first_drop.dataSource = datas
        second_drop.dataSource = datas
        third_drop.dataSource = datas
        
        first_drop.selectionAction = { [unowned self] (index: Int, item: String) in
            self.question1Btn.setTitle(item, for: .normal)
        }
        
        second_drop.selectionAction = { [unowned self] (index: Int, item: String) in
            self.question2Btn.setTitle(item, for: .normal)
        }
        
        third_drop.selectionAction = { [unowned self] (index: Int, item: String) in
            self.question3Btn.setTitle(item, for: .normal)
        }
    }
    
    func getQuestions() {
        SVProgressHUD.show()
        DustanService.sharedInstance.getQuestions(onSuccess: { (response) in
            debugPrint(response)
            SVProgressHUD.dismiss()
            if let result = response.result.value as? NSDictionary{
                if let status = result["status"] as? Bool {
                    if status == true {
                        if let questions = result["data"] as? [NSDictionary] {
                            self.processData(data: questions)
                        }
                    } else {
                        return
                    }
                }
            }
        }) { (error) in
            SVProgressHUD.dismiss()
        }
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
        first_drop.show()
    }
    
    @IBAction func question2Btn_Click(_ sender: Any) {
        second_drop.show()
    }
    
    @IBAction func question3Btn_Click(_ sender: Any) {
        third_drop.show()
    }
    
    func getIDFromQuestion(question: String) -> String {
        for item in Constants.questions {
            if item.question == question {
                return item.id
            }
        }
        return ""
    }
    
    @IBAction func continueBtn_Click(_ sender: Any) {
        let answer1 = answer1TextField.text
        let answer2 = answer2TextField.text
        let answer3 = answer3TextField.text
        
        if (answer1?.isEmpty)! || (answer2?.isEmpty)! || (answer3?.isEmpty)! {
            showAlert(message: "Please answer all questions!")
            return
        }
        
        var answers = [NSDictionary]()
        let firstID: String = getIDFromQuestion(question: (question1Btn.titleLabel?.text)!)
        let secondID: String = getIDFromQuestion(question: (question2Btn.titleLabel?.text)!)
        let thirdID: String = getIDFromQuestion(question: (question3Btn.titleLabel?.text)!)
        if firstID != "" {
            let first_Answer: [String:String] = ["question_id":firstID, "answer": answer1!]
            answers.append(first_Answer as NSDictionary)
        } else {
            showAlert(message: "Please select question for first answer")
            return
        }
        
        if secondID != "" {
            let second_Answer: [String:String] = ["question_id":secondID, "answer": answer2!]
            answers.append(second_Answer as NSDictionary)
        } else {
            showAlert(message: "Please select question for second answer")
            return
        }
        
        if thirdID != "" {
            let third_Answer: [String:String] = ["question_id":thirdID, "answer": answer3!]
            answers.append(third_Answer as NSDictionary)
        } else {
            showAlert(message: "Please select question for third answer")
            return
        }
        
        SVProgressHUD.show()
        DustanService.sharedInstance.saveAnswers(token: Constants.token, answers: answers, onSuccess: { (response) in
            debugPrint(response)
            SVProgressHUD.dismiss()
            if let result = response.result.value as? NSDictionary{
                if let status = result["status"] as? Bool {
                    if status == true {
                        self.performSegue(withIdentifier: "mainSegue", sender: nil)
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
}
