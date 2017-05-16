//
//  AlertListViewController.swift
//  Dustan
//
//  Created by Mobile Star on 06/03/17.
//  Copyright © 2017 Mobile Star. All rights reserved.
//

import UIKit

class AlertListViewController: UIViewController {

    @IBOutlet weak var doorNameBtn: UIButton!
    @IBOutlet weak var internalBtn: UIButton!
    @IBOutlet weak var externalBtn: UIButton!
    @IBOutlet weak var remoteBtn: UIButton!
    @IBOutlet weak var tamperBtn: UIButton!
    @IBOutlet weak var gsmBtn: UIButton!
    @IBOutlet weak var mainsBtn: UIButton!
    @IBOutlet weak var doorBtn: UIButton!
    @IBOutlet weak var lowBtn: UIButton!
    @IBOutlet weak var bellBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()

        doorNameBtn.layer.cornerRadius = 5
        doorNameBtn.layer.borderWidth = 2
        doorNameBtn.layer.borderColor = UIColor.black.cgColor
        doorNameBtn.titleLabel?.textAlignment = NSTextAlignment.center
    }
    
    func initUI() {
        if UserDefaults.standard.bool(forKey: "internal") == false {
            internalBtn.titleLabel?.text = "Off"
        } else {
            internalBtn.titleLabel?.text = "On"
        }
        
        if UserDefaults.standard.bool(forKey: "external") == false {
            externalBtn.titleLabel?.text = "Off"
        } else {
            externalBtn.titleLabel?.text = "On"
        }
        
        if UserDefaults.standard.bool(forKey: "remote") == false {
            remoteBtn.titleLabel?.text = "Off"
        } else {
            remoteBtn.titleLabel?.text = "On"
        }
        
        if UserDefaults.standard.bool(forKey: "tamper") == false {
            tamperBtn.titleLabel?.text = "Off"
        } else {
            tamperBtn.titleLabel?.text = "On"
        }
        
        if UserDefaults.standard.bool(forKey: "gsm_attempt") == false {
            gsmBtn.titleLabel?.text = "Off"
        } else {
            gsmBtn.titleLabel?.text = "On"
        }
        
        if UserDefaults.standard.bool(forKey: "mains") == false {
            mainsBtn.titleLabel?.text = "Off"
        } else {
            mainsBtn.titleLabel?.text = "On"
        }
        
        if UserDefaults.standard.bool(forKey: "low") == false {
            lowBtn.titleLabel?.text = "Off"
        } else {
            lowBtn.titleLabel?.text = "On"
        }
        
        if UserDefaults.standard.bool(forKey: "door_error") == false {
            doorBtn.titleLabel?.text = "Off"
        } else {
            doorBtn.titleLabel?.text = "On"
        }
        
        if UserDefaults.standard.bool(forKey: "bell") == false {
            bellBtn.titleLabel?.text = "Off"
        } else {
            bellBtn.titleLabel?.text = "On"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func logoBtn_Click(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "homeVC") as! HomeViewController
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    @IBAction func lockBtn_Click(_ sender: Any) {
    }
    
    @IBAction func doorNameBtn_Click(_ sender: Any) {
    }
    
    @IBAction func backBtn_Click(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func internal_Click(_ sender: Any) {
        if UserDefaults.standard.bool(forKey: "internal") == false {
            internalBtn.titleLabel?.text = "On"
            UserDefaults.standard.set(true, forKey: "internal")
            UserDefaults.standard.synchronize()
        } else {
            internalBtn.titleLabel?.text = "Off"
            UserDefaults.standard.set(false, forKey: "internal")
            UserDefaults.standard.synchronize()
        }
    }
    
    @IBAction func external_Click(_ sender: Any) {
        if UserDefaults.standard.bool(forKey: "external") == false {
            externalBtn.titleLabel?.text = "On"
            UserDefaults.standard.set(true, forKey: "external")
            UserDefaults.standard.synchronize()
        } else {
            externalBtn.titleLabel?.text = "Off"
            UserDefaults.standard.set(false, forKey: "external")
            UserDefaults.standard.synchronize()
        }
    }
    
    @IBAction func remote_Click(_ sender: Any) {
        if UserDefaults.standard.bool(forKey: "remote") == false {
            remoteBtn.titleLabel?.text = "On"
            UserDefaults.standard.set(true, forKey: "remote")
            UserDefaults.standard.synchronize()
        } else {
            remoteBtn.titleLabel?.text = "Off"
            UserDefaults.standard.set(false, forKey: "remote")
            UserDefaults.standard.synchronize()
        }
    }

    @IBAction func tamper_Click(_ sender: Any) {
        if UserDefaults.standard.bool(forKey: "tamper") == false {
            tamperBtn.titleLabel?.text = "On"
            UserDefaults.standard.set(true, forKey: "tamper")
            UserDefaults.standard.synchronize()
        } else {
            tamperBtn.titleLabel?.text = "Off"
            UserDefaults.standard.set(false, forKey: "tamper")
            UserDefaults.standard.synchronize()
        }
    }
    
    @IBAction func gsm_Click(_ sender: Any) {
        if UserDefaults.standard.bool(forKey: "gsm_attempt") == false {
            gsmBtn.titleLabel?.text = "On"
            UserDefaults.standard.set(true, forKey: "gsm_attempt")
            UserDefaults.standard.synchronize()
        } else {
            gsmBtn.titleLabel?.text = "Off"
            UserDefaults.standard.set(false, forKey: "gsm_attempt")
            UserDefaults.standard.synchronize()
        }
    }
    
    @IBAction func mains_Click(_ sender: Any) {
        if UserDefaults.standard.bool(forKey: "mains") == false {
            mainsBtn.titleLabel?.text = "On"
            UserDefaults.standard.set(true, forKey: "mains")
            UserDefaults.standard.synchronize()
        } else {
            mainsBtn.titleLabel?.text = "Off"
            UserDefaults.standard.set(false, forKey: "mains")
            UserDefaults.standard.synchronize()
        }
    }
    
    @IBAction func low_Click(_ sender: Any) {
        if UserDefaults.standard.bool(forKey: "low") == false {
            lowBtn.titleLabel?.text = "On"
            UserDefaults.standard.set(true, forKey: "low")
            UserDefaults.standard.synchronize()
        } else {
            lowBtn.titleLabel?.text = "Off"
            UserDefaults.standard.set(false, forKey: "low")
            UserDefaults.standard.synchronize()
        }
    }
    
    @IBAction func door_Click(_ sender: Any) {
        if UserDefaults.standard.bool(forKey: "door_error") == false {
            doorBtn.titleLabel?.text = "On"
            UserDefaults.standard.set(true, forKey: "door_error")
            UserDefaults.standard.synchronize()
        } else {
            doorBtn.titleLabel?.text = "Off"
            UserDefaults.standard.set(false, forKey: "door_error")
            UserDefaults.standard.synchronize()
        }
    }
    
    @IBAction func bell_Click(_ sender: Any) {
        if UserDefaults.standard.bool(forKey: "bell") == false {
            bellBtn.titleLabel?.text = "On"
            UserDefaults.standard.set(true, forKey: "bell")
            UserDefaults.standard.synchronize()
        } else {
            bellBtn.titleLabel?.text = "Off"
            UserDefaults.standard.set(false, forKey: "bell")
            UserDefaults.standard.synchronize()
        }
    }
}
