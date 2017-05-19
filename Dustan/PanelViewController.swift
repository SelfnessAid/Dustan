//
//  PanelViewController.swift
//  Dustan
//
//  Created by Mobile Star on 02/03/17.
//  Copyright © 2017 Mobile Star. All rights reserved.
//

import UIKit
import SVProgressHUD

class PanelViewController: UIViewController, UIGestureRecognizerDelegate{
    
    var swipeGesture: UISwipeGestureRecognizer!

    @IBOutlet weak var bottomLeftBtn: UIButton!
    @IBOutlet weak var topLeftBtn: UIButton!
    @IBOutlet weak var topRightBtn: UIButton!
    @IBOutlet weak var doorNameBtn: UIButton!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var centerImg: UIImageView!
    
    var door: Door = Door()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    func initialize() {
        doorNameBtn.setTitle(door.name, for: .normal)
        UserDefaults.standard.setValue(door.name, forKey: "door_name")
        UserDefaults.standard.synchronize()
        
        doorNameBtn.layer.cornerRadius = 5
        doorNameBtn.layer.borderWidth = 2
        doorNameBtn.layer.borderColor = UIColor.black.cgColor
        doorNameBtn.titleLabel?.textAlignment = NSTextAlignment.center
        
        swipeGesture = UISwipeGestureRecognizer.init(target: self, action: #selector(swipeAction))
        swipeGesture.direction = .right
        swipeGesture.delegate = self
        self.view.addGestureRecognizer(swipeGesture)
        
        centerImg.isUserInteractionEnabled = true
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        centerImg.addGestureRecognizer(tapRecognizer)
        
        if door.state == "false" {
            centerImg.image = UIImage(named: "unlock")
            infoLabel.text = "Unlocked"
        }
        
    }
    
    @IBAction func backBtn_Click(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    func swipeAction(gesture: UISwipeGestureRecognizer) {
        
        if UserDefaults.standard.bool(forKey: "GSM") == true {
            showAlert(message: "GSM is blocked now. Please enable it on Administrator")
            return
        }
        
//        SVProgressHUD.show()
        
        if centerImg.image == #imageLiteral(resourceName: "lock") {
            DustanService.sharedInstance.doorLock(token: Constants.token, code: self.door.code, password: self.door.password, on: false, onSuccess: { (response) in
//                SVProgressHUD.dismiss()
                if let result = response.result.value as? NSDictionary{
                    if let status = result["status"] as? Bool {
                        if status == true {
                            self.centerImg.image = UIImage(named: "unlock")
                            self.infoLabel.text = "Unlocked"
                        } else {
                            if let message = result["data"] as? String {
                                self.showAlert(message: message)
                                return
                            }
                        }
                    }
                }
            }, onFailure: { (error) in
//                SVProgressHUD.dismiss()
                self.showAlert(message: error.localizedDescription)
            })
        }
    }
    
    func imageTapped(gestureRecognizer: UITapGestureRecognizer) {
        if UserDefaults.standard.bool(forKey: "GSM") == true {
            showAlert(message: "GSM is blocked now. Please enable it on Administrator")
            return
        }
        
        let tappedImage = self.centerImg.image
//        SVProgressHUD.show()
        if tappedImage == #imageLiteral(resourceName: "camera") {
            DustanService.sharedInstance.doorCamera(token: Constants.token, code: self.door.code, password: self.door.password, on: true, onSuccess: { (response) in
//                SVProgressHUD.dismiss()
                if let result = response.result.value as? NSDictionary{
                    if let status = result["status"] as? Bool {
                        if status == true {
                            if let data = result["data"] as? NSDictionary {
                                
                                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                                let cameraVC = storyBoard.instantiateViewController(withIdentifier: "cameraVC") as! CameraViewController
                                cameraVC.url = (data["door_img"] as? String)!
                                self.navigationController?.pushViewController(cameraVC, animated:true)
                            }
                        } else {
                            if let message = result["data"] as? String {
                                self.showAlert(message: message)
                                return
                            }
                        }
                    }
                }
            }, onFailure: { (error) in
//                SVProgressHUD.dismiss()
                self.showAlert(message: error.localizedDescription)
            })
        } else if tappedImage == #imageLiteral(resourceName: "phone") {
            DustanService.sharedInstance.doorBlock(token: Constants.token, code: self.door.code, password: self.door.password, on: true, onSuccess: { (response) in
//                SVProgressHUD.dismiss()
                if let result = response.result.value as? NSDictionary{
                    if let status = result["status"] as? Bool {
                        if status == true {
                            
                        } else {
                            if let message = result["data"] as? String {
                                self.showAlert(message: message)
                                return
                            }
                        }
                    }
                }
            }, onFailure: { (error) in
//                SVProgressHUD.dismiss()
                self.showAlert(message: error.localizedDescription)
            })
        } else if tappedImage == #imageLiteral(resourceName: "bell") {
            DustanService.sharedInstance.doorBell(token: Constants.token, code: self.door.code, password: self.door.password, on: true, onSuccess: { (response) in
//                SVProgressHUD.dismiss()
                if let result = response.result.value as? NSDictionary{
                    if let status = result["status"] as? Bool {
                        if status == true {
                            
                        } else {
                            if let message = result["data"] as? String {
                                self.showAlert(message: message)
                                return
                            }
                        }
                    }
                }
            }, onFailure: { (error) in
//                SVProgressHUD.dismiss()
                self.showAlert(message: error.localizedDescription)
            })
        } else if tappedImage == #imageLiteral(resourceName: "unlock"){
            DustanService.sharedInstance.doorLock(token: Constants.token, code: self.door.code, password: self.door.password, on: false, onSuccess: { (response) in
//                SVProgressHUD.dismiss()
                if let result = response.result.value as? NSDictionary{
                    if let status = result["status"] as? Bool {
                        if status == true {
                            self.centerImg.image = UIImage(named: "lock")
                            self.infoLabel.text = "> Slide to unlock"
                        } else {
                            if let message = result["data"] as? String {
                                self.showAlert(message: message)
                                return
                            }
                        }
                    }
                }
            }, onFailure: { (error) in
//                SVProgressHUD.dismiss()
                self.showAlert(message: error.localizedDescription)
            })
        }
    }
    
    func showAlert(message:String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changeInfoText(img: UIImage) {
        if img == #imageLiteral(resourceName: "camera") {
            infoLabel.text = "Press to take picture"
        } else if img == #imageLiteral(resourceName: "phone") {
            infoLabel.text = "Press to call door"
        } else if img == #imageLiteral(resourceName: "bell") {
            infoLabel.text = "Press to ring door bell"
        } else if img == #imageLiteral(resourceName: "lock") {
            infoLabel.text = "> Slide to unlock"
        } else if img == #imageLiteral(resourceName: "unlock") {
            infoLabel.text = "Press to lock"
        }
    }
    
    @IBAction func bottomLeftBtn_Click(_ sender: Any) {
        let tmpImg = centerImg.image
        centerImg.image = bottomLeftBtn.currentImage
        bottomLeftBtn.setImage(tmpImg, for: .normal)
        
        changeInfoText(img: centerImg.image!)
    }
    
    @IBAction func topLeftBtn_Click(_ sender: Any) {
        let tmpImg = centerImg.image
        centerImg.image = topLeftBtn.currentImage
        topLeftBtn.setImage(tmpImg, for: .normal)
        
        changeInfoText(img: centerImg.image!)
    }

    @IBAction func topRightBtn_Click(_ sender: Any) {
        let tmpImg = centerImg.image
        centerImg.image = topRightBtn.currentImage
        topRightBtn.setImage(tmpImg, for: .normal)
        
        changeInfoText(img: centerImg.image!)
    }
    @IBAction func logoBtn_Click(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "homeVC") as! HomeViewController
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    @IBAction func doorNameBtn_Click(_ sender: Any) {

    }
}
