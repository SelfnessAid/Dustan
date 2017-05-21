//
//  HomeViewController.swift
//  Dustan
//
//  Created by Mobile Star on 02/03/17.
//  Copyright © 2017 Mobile Star. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var logoBtn: UIButton!
    @IBOutlet weak var lockBtn: UIButton!
    @IBOutlet weak var doorNameBtn: UIButton!
    @IBOutlet weak var selectDoorBtn: UIButton!
    @IBOutlet weak var administratorBtn: UIButton!
    @IBOutlet weak var addDoorBtn: UIButton!
    @IBOutlet weak var doorStatusBtn: UIButton!
    @IBOutlet weak var alertsBtn: UIButton!
    @IBOutlet weak var supportBtn: UIButton!
    @IBOutlet weak var faqBtn: UIButton!
    @IBOutlet weak var websiteBtn: UIButton!
    @IBOutlet weak var settingBtn: UIButton!
    
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
            showAlert(title: "Notice", message: "You have no selected door now.")
        }
    }
    
    func showAlert(title: String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func doorNameBtn_Click(_ sender: Any) {
        
    }
    
    @IBAction func selectDoorBtn_Click(_ sender: Any) {
        performSegue(withIdentifier: "doorListSegue", sender: nil)
    }
    
    @IBAction func administratorBtn_Click(_ sender: Any) {
        performSegue(withIdentifier: "manageVCSegue", sender: nil)
    }
    
    @IBAction func doorStatusBtn_Click(_ sender: Any) {
        performSegue(withIdentifier: "manageDoorSegue", sender: nil)
    }
    
    @IBAction func alertBtn_Click(_ sender: Any) {
        performSegue(withIdentifier: "alertListSegue", sender: nil)
    }
    
    @IBAction func supportBtn_Click(_ sender: Any) {
        performSegue(withIdentifier: "supportSegue", sender: nil)
    }
    
    @IBAction func faqBtn_Click(_ sender: Any) {
        performSegue(withIdentifier: "faqSegue", sender: nil)
    }
    
    @IBAction func websiteBtn_Click(_ sender: Any) {
        
    }
    
    @IBAction func settingBtn_Click(_ sender: Any) {
        performSegue(withIdentifier: "settingsSegue", sender: nil)
        
    }
    
    @IBAction func backBtn_Click(_ sender: Any) {
        self.navigationController!.popViewController(animated: true)
    }
}
