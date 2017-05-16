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
            internalBtn.setTitle("Off", for: .normal)
        } else {
            internalBtn.setTitle("On", for: .normal)
        }
        
        if UserDefaults.standard.bool(forKey: "external") == false {
            externalBtn.setTitle("Off", for: .normal)
        } else {
            externalBtn.setTitle("On", for: .normal)
        }
        
        if UserDefaults.standard.bool(forKey: "remote") == false {
            remoteBtn.setTitle("Off", for: .normal)
        } else {
            remoteBtn.setTitle("On", for: .normal)
        }
        
        if UserDefaults.standard.bool(forKey: "tamper") == false {
            tamperBtn.setTitle("Off", for: .normal)
        } else {
            tamperBtn.setTitle("On", for: .normal)
        }
        
        if UserDefaults.standard.bool(forKey: "gsm_attempt") == false {
            gsmBtn.setTitle("Off", for: .normal)
        } else {
            gsmBtn.setTitle("On", for: .normal)
        }
        
        if UserDefaults.standard.bool(forKey: "mains") == false {
            mainsBtn.setTitle("Off", for: .normal)
        } else {
            mainsBtn.setTitle("On", for: .normal)
        }
        
        if UserDefaults.standard.bool(forKey: "low") == false {
            lowBtn.setTitle("Off", for: .normal)
        } else {
            lowBtn.setTitle("On", for: .normal)
        }
        
        if UserDefaults.standard.bool(forKey: "door_error") == false {
            doorBtn.setTitle("Off", for: .normal)
        } else {
            doorBtn.setTitle("On", for: .normal)
        }
        
        if UserDefaults.standard.bool(forKey: "bell") == false {
            bellBtn.setTitle("Off", for: .normal)
        } else {
            bellBtn.setTitle("On", for: .normal)
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
            internalBtn.setTitle("On", for: .normal)
            UserDefaults.standard.set(true, forKey: "internal")
            UserDefaults.standard.synchronize()
        } else {
            internalBtn.setTitle("Off", for: .normal)
            UserDefaults.standard.set(false, forKey: "internal")
            UserDefaults.standard.synchronize()
        }
    }
    
    @IBAction func external_Click(_ sender: Any) {
        if UserDefaults.standard.bool(forKey: "external") == false {
            externalBtn.setTitle("On", for: .normal)
            UserDefaults.standard.set(true, forKey: "external")
            UserDefaults.standard.synchronize()
        } else {
            externalBtn.setTitle("Off", for: .normal)
            UserDefaults.standard.set(false, forKey: "external")
            UserDefaults.standard.synchronize()
        }
    }
    
    @IBAction func remote_Click(_ sender: Any) {
        if UserDefaults.standard.bool(forKey: "remote") == false {
            remoteBtn.setTitle("On", for: .normal)
            UserDefaults.standard.set(true, forKey: "remote")
            UserDefaults.standard.synchronize()
        } else {
            remoteBtn.setTitle("Off", for: .normal)
            UserDefaults.standard.set(false, forKey: "remote")
            UserDefaults.standard.synchronize()
        }
    }

    @IBAction func tamper_Click(_ sender: Any) {
        if UserDefaults.standard.bool(forKey: "tamper") == false {
            tamperBtn.setTitle("On", for: .normal)
            UserDefaults.standard.set(true, forKey: "tamper")
            UserDefaults.standard.synchronize()
        } else {
            tamperBtn.setTitle("Off", for: .normal)
            UserDefaults.standard.set(false, forKey: "tamper")
            UserDefaults.standard.synchronize()
        }
    }
    
    @IBAction func gsm_Click(_ sender: Any) {
        if UserDefaults.standard.bool(forKey: "gsm_attempt") == false {
            gsmBtn.setTitle("On", for: .normal)
            UserDefaults.standard.set(true, forKey: "gsm_attempt")
            UserDefaults.standard.synchronize()
        } else {
            gsmBtn.setTitle("Off", for: .normal)
            UserDefaults.standard.set(false, forKey: "gsm_attempt")
            UserDefaults.standard.synchronize()
        }
    }
    
    @IBAction func mains_Click(_ sender: Any) {
        if UserDefaults.standard.bool(forKey: "mains") == false {
            mainsBtn.setTitle("On", for: .normal)
            UserDefaults.standard.set(true, forKey: "mains")
            UserDefaults.standard.synchronize()
        } else {
            mainsBtn.setTitle("Off", for: .normal)
            UserDefaults.standard.set(false, forKey: "mains")
            UserDefaults.standard.synchronize()
        }
    }
    
    @IBAction func low_Click(_ sender: Any) {
        if UserDefaults.standard.bool(forKey: "low") == false {
            lowBtn.setTitle("On", for: .normal)
            UserDefaults.standard.set(true, forKey: "low")
            UserDefaults.standard.synchronize()
        } else {
            lowBtn.setTitle("Off", for: .normal)
            UserDefaults.standard.set(false, forKey: "low")
            UserDefaults.standard.synchronize()
        }
    }
    
    @IBAction func door_Click(_ sender: Any) {
        if UserDefaults.standard.bool(forKey: "door_error") == false {
            doorBtn.setTitle("On", for: .normal)
            UserDefaults.standard.set(true, forKey: "door_error")
            UserDefaults.standard.synchronize()
        } else {
            doorBtn.setTitle("Off", for: .normal)
            UserDefaults.standard.set(false, forKey: "door_error")
            UserDefaults.standard.synchronize()
        }
    }
    
    @IBAction func bell_Click(_ sender: Any) {
        if UserDefaults.standard.bool(forKey: "bell") == false {
            bellBtn.setTitle("On", for: .normal)
            UserDefaults.standard.set(true, forKey: "bell")
            UserDefaults.standard.synchronize()
        } else {
            bellBtn.setTitle("Off", for: .normal)
            UserDefaults.standard.set(false, forKey: "bell")
            UserDefaults.standard.synchronize()
        }
    }
}
