//
//  PlanTableViewTVC.swift
//  TCNMachineTest
//
//  Created by Akansha Rana on 13/11/25.
//

import UIKit

class PlanTableViewTVC: UITableViewCell {

    @IBOutlet weak var planeNameTXTLbl: UILabel!
    @IBOutlet weak var planPriceLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
