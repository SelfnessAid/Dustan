//
//  BlockGSMViewController.swift
//  Dustan
//
//  Created by Mobile Star on 02/03/17.
//  Copyright © 2017 Mobile Star. All rights reserved.
//

import UIKit

class BlockGSMViewController: UIViewController {

    @IBOutlet weak var logoBtn: UIButton!
    @IBOutlet weak var lockBtn: UIButton!
    @IBOutlet weak var doorNameBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        doorNameBtn.layer.cornerRadius = 5
        doorNameBtn.layer.borderWidth = 2
        doorNameBtn.layer.borderColor = UIColor.black.cgColor
        doorNameBtn.titleLabel?.textAlignment = NSTextAlignment.center
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let str = UserDefaults.standard.string(forKey: "door_name") {
            doorNameBtn.setTitle(str, for: .normal)
        }
    }

    @IBAction func logoBtn_Click(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "homeVC") as! HomeViewController
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    func getDoor(door_code: String) -> Door {
        for door: Door in Constants.doors {
            if door.code == door_code {
                return door
            }
        }
        return Door()
    }
    
    @IBAction func lockBtn_Click(_ sender: Any) {
        if let doorCode = UserDefaults.standard.string(forKey: "door_code") {
            let door = getDoor(door_code: doorCode)
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let panelVC = storyBoard.instantiateViewController(withIdentifier: "panelVC") as! PanelViewController
            panelVC.door = door
            self.navigationController?.pushViewController(panelVC, animated:true)
        } else {
            let alert = UIAlertController(title: "Notice", message: "You have no selected door now.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    @IBAction func doorNameBtn_Click(_ sender: Any) {
    }
    @IBAction func yesBtn_Click(_ sender: Any) {
        showAlert(message: "GSM is blocked successfully", flag: true)
    }
    @IBAction func noBtn_Click(_ sender: Any) {
        showAlert(message: "GSM is activated successfully", flag: false)
    }
    
    func showAlert(message: String, flag: Bool) {
        let alert = UIAlertController(title: "Notice", message: message, preferredStyle: .alert)
        let okAct = UIAlertAction(title: "OK", style: .default) { (act) in
            if flag == true {
                UserDefaults.standard.set(false, forKey: "GSM")
                UserDefaults.standard.synchronize()
            } else {
                UserDefaults.standard.set(true, forKey: "GSM")
                UserDefaults.standard.synchronize()
            }
        }
        
        let cancelAct = UIAlertAction(title: "Cancel", style: .default) { (act) in
            
        }
        
        alert.addAction(okAct)
        alert.addAction(cancelAct)
        self.present(alert, animated: true, completion: nil)
        
    }
    @IBAction func backBtn_Click(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
}
