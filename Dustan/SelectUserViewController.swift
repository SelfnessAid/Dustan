//
//  SelectUserViewController.swift
//  Dustan
//
//  Created by Mobile Star on 08/03/17.
//  Copyright © 2017 Mobile Star. All rights reserved.
//

import UIKit

class SelectUserViewController: UIViewController {

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
    
    @IBAction func logoBtn_Click(_ sender: Any) {
    }
    
    @IBAction func lockBtn_Click(_ sender: Any) {
    }
    
    @IBAction func adminstratorBtn_Click(_ sender: Any) {
        performSegue(withIdentifier: "passwordSegue", sender: nil)
    }
    
    @IBAction func userBtn_Click(_ sender: Any) {
        performSegue(withIdentifier: "passwordSegue", sender: nil)
    }
    
    @IBAction func doorNameBtn_Click(_ sender: Any) {
    }
}
