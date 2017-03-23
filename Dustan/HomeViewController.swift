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

    @IBAction func logoBtn_Click(_ sender: Any) {
        
    }
    
    @IBAction func lockBtn_Click(_ sender: Any) {
        
    }
    
    @IBAction func doorNameBtn_Click(_ sender: Any) {
        
    }
    
    @IBAction func selectDoorBtn_Click(_ sender: Any) {
        performSegue(withIdentifier: "doorListSegue", sender: nil)
    }
    
    @IBAction func administratorBtn_Click(_ sender: Any) {
        performSegue(withIdentifier: "manageVCSegue", sender: nil)
    }
    
    @IBAction func addDoorBtn_Click(_ sender: Any) {
        performSegue(withIdentifier: "manageDoorSegue", sender: nil)
    }
    
    @IBAction func doorStatusBtn_Click(_ sender: Any) {
        performSegue(withIdentifier: "doorStatusSegue", sender: nil)
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
}
