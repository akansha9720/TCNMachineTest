//
//  devicesTableViewTVC.swift
//  TCNMachineTest
//
//  Created by Akansha Rana on 13/11/25.
//

import UIKit

class DevicesTableViewTVC: UITableViewCell {

    @IBOutlet weak var deviceNameTxtLbl: UILabel!
    @IBOutlet weak var deviceImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
