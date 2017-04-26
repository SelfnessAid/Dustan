//
//  SettingsViewController.swift
//  Dustan
//
//  Created by Mobile Star on 06/03/17.
//  Copyright © 2017 Mobile Star. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

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

    @IBAction func doorNameBtn_Click(_ sender: Any) {
    }
    @IBAction func logoBtn_Click(_ sender: Any) {
    }
    @IBAction func lockBtn_Click(_ sender: Any) {
    }
    @IBAction func updateEmailBtn_Click(_ sender: Any) {
        performSegue(withIdentifier: "updateEmailSegue", sender: nil)
    }
    @IBAction func updatePasswordBtn_Click(_ sender: Any) {
        performSegue(withIdentifier: "updatePasswordSegue", sender: nil)
    }
    
    @IBAction func factoryResetBtn_Click(_ sender: Any) {
        performSegue(withIdentifier: "resetFactorySegue", sender: nil)
    }
    @IBAction func backBtn_Click(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
}
