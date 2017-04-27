//
//  DeleteDoorViewController.swift
//  Dustan
//
//  Created by Mobile Star on 06/03/17.
//  Copyright © 2017 Mobile Star. All rights reserved.
//

import UIKit
import SVProgressHUD

class DeleteDoorViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var doorNameBtn: UIButton!
    @IBOutlet weak var doorTableView: UITableView!
    
    var doorList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        doorNameBtn.layer.cornerRadius = 5
        doorNameBtn.layer.borderWidth = 2
        doorNameBtn.layer.borderColor = UIColor.black.cgColor
        doorNameBtn.titleLabel?.textAlignment = NSTextAlignment.center
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "deleteDoorCell") as! DeleteDoorTableViewCell
        cell.doorNameLabel.text = "\(indexPath.row + 1)  " + Constants.doors[indexPath.row].name
        cell.accessoryType = cell.isSelected ? .checkmark: .none
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark) {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
    }
    
    @IBAction func logoBtn_Click(_ sender: Any) {
        
    }

    @IBAction func lockBtn_Click(_ sender: Any) {
        
    }
    
    @IBAction func doorNameBtn_Click(_ sender: Any) {
        
    }
    
    @IBAction func deleteBtn_Click(_ sender: Any) {
        if (doorTableView.indexPathsForSelectedRows?.count)! > 0 {
            let keys: [String] = (doorTableView.indexPathsForSelectedRows?.flatMap({ (indexPath) -> String? in
                return String(indexPath.row)
            }))!
            SVProgressHUD.show()
            DustanService.sharedInstance.deleteDoor(token: Constants.token, keycodes: keys, onSuccess: { (response) in
                debugPrint(response)
                SVProgressHUD.dismiss()
                if let result = response.result.value as? NSDictionary{
                    if let status = result["status"] as? Bool {
                        if status == true {
                            if let door_status = result["data"] as? Bool {
                                if door_status == true {
                                    self.getDoors()
                                } else {
                                    
                                }
                            }
                        } else {
                            return
                        }
                    }
                }
            }, onFailure: { (error) in
                
            })
        }
    }
    @IBAction func backBtn_Click(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
}
