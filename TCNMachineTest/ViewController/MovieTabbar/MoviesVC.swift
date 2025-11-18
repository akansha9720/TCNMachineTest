//
//  MoviesVC.swift
//  TCNMachineTest
//
//  Created by Akansha Rana on 13/11/25.
//

import UIKit

class MoviesVC: UIViewController {
    
    @IBOutlet weak var myTableview: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    let sections = [
        "Documentaries", "New Releases", "Trending Now", "Recommended",
        "Filmmakers", "Musicians", "Artist", "Podcasts", "From India", "From Greece"
    ]
    
    var movies1 = [#imageLiteral(resourceName: "Card (4)"),#imageLiteral(resourceName: "Card"),#imageLiteral(resourceName: "Card (4)"),#imageLiteral(resourceName: "Card (6)"),#imageLiteral(resourceName: "Card (9)")]
    var movies2 = [#imageLiteral(resourceName: "Card (2)"),#imageLiteral(resourceName: "Card (3)"),#imageLiteral(resourceName: "Card (1)"),#imageLiteral(resourceName: "Card (8)"),#imageLiteral(resourceName: "Card (7)")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "MoviesTVC", bundle: nil)
        myTableview.register(nib, forCellReuseIdentifier: "cell")
        
        // Observe tableView content size
        myTableview.addObserver(self,
                                forKeyPath: "contentSize",
                                options: .new,
                                context: nil)
        
    }
    
    override func observeValue(forKeyPath keyPath: String?,
                               of object: Any?,
                               change: [NSKeyValueChangeKey : Any]?,
                               context: UnsafeMutableRawPointer?) {
        
        if keyPath == "contentSize" {
            tableViewHeight.constant = myTableview.contentSize.height
            self.view.layoutIfNeeded()
        }
    }
    deinit {
        myTableview.removeObserver(self, forKeyPath: "contentSize")
    }
    
    
    
}


// MARK: - UITableViewDataSource Methods

extension MoviesVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MoviesTVC
        cell.selectionStyle = .none
        cell.imageArray.removeAll()
        cell.txtLbl.text = sections[indexPath.row]
        
        if indexPath.row % 2 == 0 {
            for i in 0..<movies1.count {
                cell.imageArray.append(movies1[i])
            }
        }
        else {
            for i in 0..<movies2.count {
                cell.imageArray.append(movies2[i])
            }
        }
        cell.collectionView.reloadData()
        
        return cell
    }
    
    
}
