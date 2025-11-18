//
//  SidemenuVC.swift
//  TCNMachineTest
//
//  Created by Akansha Rana on 14/11/25.
//

import UIKit

class SidemenuVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
   
    
    //MARK: - Navigation
    
    @IBAction func logoutBtnClick(_ sender: UIButton) {
        showLogoutAlert()
    }
    
    func showLogoutAlert() {
        let alert = UIAlertController(
            title: "Logout",
            message: "Are you sure you want to logout?",
            preferredStyle: .alert
        )
        
        let yesAction = UIAlertAction(title: "Yes", style: .destructive) { _ in
            print("performLogout")
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(yesAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }

    
}
