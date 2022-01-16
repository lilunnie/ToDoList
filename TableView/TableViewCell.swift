//
//  TableViewCell.swift
//  TableView
//
//  Created by Imane Fadel on 22/11/2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    //@IBOutlet weak var Description: UILabel!
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var SwitchStatus: UISwitch!
}
