//
//  PanelViewController.swift
//  Dustan
//
//  Created by Mobile Star on 02/03/17.
//  Copyright © 2017 Mobile Star. All rights reserved.
//

import UIKit

class PanelViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var swipeGesture: UISwipeGestureRecognizer!

    @IBOutlet weak var bottomLeftBtn: UIButton!
    @IBOutlet weak var topLeftBtn: UIButton!
    @IBOutlet weak var topRightBtn: UIButton!
    @IBOutlet weak var doorNameBtn: UIButton!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var centerImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    func initialize() {
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
        
    }
    
    func swipeAction(gesture: UISwipeGestureRecognizer) {
        if centerImg.image == #imageLiteral(resourceName: "lock") {
            performSegue(withIdentifier: "unlockVCSegue", sender: nil)
        }
    }
    
    func imageTapped(gestureRecognizer: UITapGestureRecognizer) {
        let tappedImageView = gestureRecognizer.view!
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
    
    @IBAction func doorNameBtn_Click(_ sender: Any) {

    }
}
