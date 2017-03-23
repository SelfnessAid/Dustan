//
//  ManageViewController.swift
//  Dustan
//
//  Created by Mobile Star on 02/03/17.
//  Copyright © 2017 Mobile Star. All rights reserved.
//

import UIKit

class ManageViewController: UIViewController {

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
    }

    @IBAction func logoBtn_Click(_ sender: Any) {
    }

    @IBAction func lockBtn_Click(_ sender: Any) {
    }
    @IBAction func doorNameBtn_Click(_ sender: Any) {
    }
    @IBAction func blockGSMBtn_Click(_ sender: Any) {
        performSegue(withIdentifier: "blockGSMSegue", sender: nil)
    }
    @IBAction func newUserBtn_Click(_ sender: Any) {
        performSegue(withIdentifier: "userListSegue", sender: nil)
    }
}
