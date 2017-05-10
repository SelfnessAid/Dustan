//
//  ManageDoorViewController.swift
//  Dustan
//
//  Created by Mobile Star on 05/03/17.
//  Copyright © 2017 Mobile Star. All rights reserved.
//

import UIKit
import SVProgressHUD

class ManageDoorViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var doorNameBtn: UIButton!
    @IBOutlet weak var doorTableView: UITableView!
    
    var doors = [String]()
    
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
        
        doorTableView.reloadData()
    }
    
    func getDoors() {
        SVProgressHUD.show()
        DustanService.sharedInstance.getAdminDoors(token: Constants.token, onSuccess: { (response) in
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

    @IBAction func backBtn_Click(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.doors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "doorCell")! as UITableViewCell
        cell.textLabel?.text = "\(indexPath.row + 1)  " + Constants.doors[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let doorStatusVC = storyBoard.instantiateViewController(withIdentifier: "doorStatusVC") as! DoorStatusViewController
        doorStatusVC.door = Constants.doors[indexPath.row]
        self.navigationController?.pushViewController(doorStatusVC, animated: true)
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
    
    @IBAction func addDoorBtn_Click(_ sender: Any) {
        performSegue(withIdentifier: "addDoorSegue", sender: nil)
    }
    
    @IBAction func deleteDoorBtn_Click(_ sender: Any) {
        performSegue(withIdentifier: "deleteDoorSegue", sender: nil)
    }

}
