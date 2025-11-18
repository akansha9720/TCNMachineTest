//
//  HomeVC.swift
//  TCNMachineTest
//
//  Created by Akansha Rana on 13/11/25.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var categoriesCollectionView: UICollectionView!    
    @IBOutlet weak var devicesTableView: UITableView!
    @IBOutlet weak var creativeNetworkTableView: UITableView!
    @IBOutlet weak var planTableView: UITableView!
    
    @IBOutlet weak var devicesTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var creativeNetworkTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var planTableViewHeight: NSLayoutConstraint!
    
    var categoriesTxt = ["Filmmakers","Musicians"]
    var categoriesIMG = [UIImage(named: "Container"), UIImage(named: "Container_2")]
    
    var deviceName = ["Smartphones","Tablet","Smart TV","Laptops"]
    var deviceIMG = [UIImage(named: "Icon"),UIImage(named: "Icon (1)"),UIImage(named: "Icon (2)"),UIImage(named: "Icon (3)")]
    
    var planTxt = ["Basic Plan","Standard Plan","Premium Plan"]
    var planPrice = ["$99.99","$199.99","$299.99"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "CategoriesCollectionTVC", bundle: nil)
        categoriesCollectionView.register(nib, forCellWithReuseIdentifier: "cell")
        
        let device_nib = UINib(nibName: "DevicesTableViewTVC", bundle: nil)
        devicesTableView.register(device_nib, forCellReuseIdentifier: "cell")
        
        let creative_nib = UINib(nibName: "CreativeNetworkTableTVC", bundle: nil)
        creativeNetworkTableView.register(creative_nib, forCellReuseIdentifier: "cell")
        
        let plan_nib = UINib(nibName: "PlanTableViewTVC", bundle: nil)
        planTableView.register(plan_nib, forCellReuseIdentifier: "cell")
        
        
        // observe contentSize changes
        observeTableViewHeightChanges()
        
    }
    
    func observeTableViewHeightChanges() {
        devicesTableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        creativeNetworkTableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        planTableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?,
                               of object: Any?,
                               change: [NSKeyValueChangeKey : Any]?,
                               context: UnsafeMutableRawPointer?) {
        if keyPath == "contentSize" {
            if let tableView = object as? UITableView {
                if tableView == devicesTableView {
                    devicesTableViewHeight.constant = tableView.contentSize.height
                } else if tableView == creativeNetworkTableView {
                    creativeNetworkTableViewHeight.constant = tableView.contentSize.height
                } else if tableView == planTableView {
                    planTableViewHeight.constant = tableView.contentSize.height
                }
                UIView.animate(withDuration: 0.2) {
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
    
    deinit {
        devicesTableView.removeObserver(self, forKeyPath: "contentSize")
        creativeNetworkTableView.removeObserver(self, forKeyPath: "contentSize")
        planTableView.removeObserver(self, forKeyPath: "contentSize")
    }
    
    
}

// MARK: - UICollectionViewDataSource Methods

extension HomeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoriesTxt.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CategoriesCollectionTVC
        cell.selectedBackgroundView = .none
        cell.txtLbl.text = categoriesTxt[indexPath.row]
        cell.imageShow.image = categoriesIMG[indexPath.row]
        return cell
    }
    
    
}

// MARK: - UITableViewDataSource Methods

extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if devicesTableView == tableView {
            return deviceName.count
        }
        else if creativeNetworkTableView == tableView {
            return 5
        }
        else{
            return planTxt.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if devicesTableView == tableView {
            let cell = devicesTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DevicesTableViewTVC
            cell.selectionStyle = .none
            cell.deviceNameTxtLbl.text = deviceName[indexPath.row]
            cell.deviceImg.image = deviceIMG[indexPath.row]
            return cell
        }
        else if creativeNetworkTableView == tableView {
            let cell = creativeNetworkTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CreativeNetworkTableTVC
            cell.selectionStyle = .none
            return cell
        }
        
        else{
            let cell = planTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PlanTableViewTVC
            cell.selectionStyle = .none
            cell.planeNameTXTLbl.text = planTxt[indexPath.row]
            cell.planPriceLbl.text = planPrice[indexPath.row]
            return cell
        }
        
    }
    
}
