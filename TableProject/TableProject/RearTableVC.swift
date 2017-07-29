//
//  RearTableVCTableViewController.swift
//  TableProject
//
//  Created by Biken maharjan on 7/28/17.
//  Copyright © 2017 Biken maharjan. All rights reserved.
//

import UIKit

// RearVC is Table View Controller
class RearTableVC: UIViewController, UITableViewDelegate,UITableViewDataSource {

    let sampleData = ["Home","Available for Downlaod","Netflix Original","TV Shows","Actions & Adventures","Children & Family Movies","Classics","Drama"]
    
    
    fileprivate let cellId = "menuVC"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
  
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // this increases the overall header height
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    // sample header --> [name and Image should be dynamic here]
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        let headerView = UIView()
        
        let frame1 = CGRect(x: 10, y: 20, width: 40, height: 40)
        let imageView = UIImageView(frame: frame1)
        imageView.image = UIImage(named:"profile-pic")
    
        
        let frame2 = CGRect(x: 60, y: 25, width: 150, height: 30)
        let name = UILabel(frame: frame2)
        name.text = "Biken Maharjan"
        name.font = UIFont(name: "Helvetica", size: 16)
        name.textColor = UIColor(red: 192.0/255, green: 192.0/255, blue: 192.0/255, alpha: 1.0)

        
        
        
        headerView.addSubview(imageView)
        headerView.addSubview(name)
        return headerView
        
    }
    
    // removes unnecessary table cells
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        return footerView
    }

    //
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! RearCell
        
        cell.textContent = sampleData[indexPath.item]
        

        cell.backgroundColor = UIColor(red: 50.0/255, green: 51.0/255, blue: 53.0/255, alpha: 1.0)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleData.count
    }
    
    

}
