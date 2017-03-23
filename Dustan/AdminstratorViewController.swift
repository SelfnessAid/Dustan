//
//  AdminstratorViewController.swift
//  Dustan
//
//  Created by Mobile Star on 02/03/17.
//  Copyright © 2017 Mobile Star. All rights reserved.
//

import UIKit

class AdminstratorViewController: UIViewController {
    @IBOutlet weak var doorNameBtn: UIButton!
    @IBOutlet weak var fullAccessBtn: UIButton!
    @IBOutlet weak var lockBtn: UIButton!
    @IBOutlet weak var logoBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doorNameBtn.layer.cornerRadius = 5
        doorNameBtn.layer.borderWidth = 2
        doorNameBtn.layer.borderColor = UIColor.black.cgColor
        doorNameBtn.titleLabel?.textAlignment = NSTextAlignment.center
        fullAccessBtn.titleLabel?.textAlignment = NSTextAlignment.center
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func fullAccessBtn_Click(_ sender: Any) {
        performSegue(withIdentifier: "panelVCSegue", sender: nil)
    }
    
    @IBAction func doorNameBtn_Click(_ sender: Any) {
        
    }
    
    @IBAction func lockBtn_Click(_ sender: Any) {
        
    }
    
    @IBAction func logoBtn_Click(_ sender: Any) {
        
    }
}
