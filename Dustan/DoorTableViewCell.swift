//
//  DoorTableViewCell.swift
//  Dustan
//
//  Created by Mobile Star on 02/03/17.
//  Copyright © 2017 Mobile Star. All rights reserved.
//

import UIKit

class DoorTableViewCell: UITableViewCell {

    @IBOutlet weak var noLabel: UILabel!
    @IBOutlet weak var doorNameLabel: UILabel!
    @IBOutlet weak var selectBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func selectBtn_Click(_ sender: Any) {
        
    }
}
