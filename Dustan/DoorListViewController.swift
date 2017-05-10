//
//  DoorListViewController.swift
//  Dustan
//
//  Created by Mobile Star on 02/03/17.
//  Copyright © 2017 Mobile Star. All rights reserved.
//

import UIKit
import SVProgressHUD

class DoorListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var logoBtn: UIButton!
    @IBOutlet weak var lockBtn: UIButton!
    @IBOutlet weak var doorNameBtn: UIButton!
    @IBOutlet weak var doorListTableView: UITableView!
    
    var doorList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doorNameBtn.layer.cornerRadius = 5
        doorNameBtn.layer.borderWidth = 2
        doorNameBtn.layer.borderColor = UIColor.black.cgColor
        doorNameBtn.titleLabel?.textAlignment = NSTextAlignment.center
        
        getDoors()
    }
    
    func processData(data: [NSDictionary]) {
        Constants.doors.removeAll()
        for item in data {
            var door: Door = Door()
            door.id = String(item["id"] as! Int)
            door.number = item["number"] as! String
            door.code = item["code"] as! String
            door.state = item["status"] as! String
            door.name = item["name"] as! String
            Constants.doors.append(door)
        }
        
        doorListTableView.reloadData()
    }
    
    func getDoors() {
        SVProgressHUD.show()
        DustanService.sharedInstance.getDoors(token: Constants.token, onSuccess: { (response) in
            debugPrint(response)
            SVProgressHUD.dismiss()
            if let result = response.result.value as? NSDictionary{
                if let status = result["status"] as? Bool {
                    if status == true {
                        if let doors = result["data"] as? [NSDictionary] {
                            self.processData(data: doors)
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.doors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "doorCell") as! DoorTableViewCell
        cell.noLabel.text = String(indexPath.row + 1)
        cell.doorNameLabel.text = Constants.doors[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let panelVC = storyBoard.instantiateViewController(withIdentifier: "panelVC") as! PanelViewController
        panelVC.door = Constants.doors[indexPath.row]
        self.navigationController?.pushViewController(panelVC, animated:true)
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
}
