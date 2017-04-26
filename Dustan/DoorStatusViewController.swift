//
//  DoorStatusViewController.swift
//  Dustan
//
//  Created by Mobile Star on 06/03/17.
//  Copyright © 2017 Mobile Star. All rights reserved.
//

import UIKit
import SVProgressHUD

class DoorStatusViewController: UIViewController {

    @IBOutlet weak var doorNameBtn: UIButton!
    @IBOutlet weak var doorLabel: UILabel!
    @IBOutlet weak var doorStateLabel: UILabel!
    @IBOutlet weak var doorCommentLabel: UILabel!
    var door: Door = Door()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        doorNameBtn.layer.cornerRadius = 5
        doorNameBtn.layer.borderWidth = 2
        doorNameBtn.layer.borderColor = UIColor.black.cgColor
        doorNameBtn.titleLabel?.textAlignment = NSTextAlignment.center
        
        doorNameBtn.isHidden = false
        doorLabel.isHidden = false
        doorStateLabel.isHidden = true
        doorCommentLabel.isHidden = true
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
    
    @IBAction func doorStatusBtn_Click(_ sender: Any) {
        SVProgressHUD.show()
        DustanService.sharedInstance.getDoorStatus(token: Constants.token, code: door.code, onSuccess: { (response) in
            debugPrint(response)
            SVProgressHUD.dismiss()
            if let result = response.result.value as? NSDictionary{
                if let status = result["status"] as? Bool {
                    if status == true {
                        if let door_status = result["data"] as? String {
                            if door_status != "false" {
                                self.doorCommentLabel.text = "Door is Unlocked"
                            } else {
                                self.doorCommentLabel.text = "Door is Locked"
                            }
                            self.doorNameBtn.isHidden = true
                            self.doorLabel.isHidden = true
                            self.doorStateLabel.isHidden = false
                            self.doorCommentLabel.isHidden = false
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
    
    @IBAction func backBtn_Click(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
}
