//
//  RearCell.swift
//  TableProject
//
//  Created by Biken maharjan on 7/28/17.
//  Copyright © 2017 Biken maharjan. All rights reserved.
//

import UIKit

class RearCell:UITableViewCell {
    
    
    @IBOutlet weak var cellContent: UILabel!
    
    var textContent: String?{
        
        didSet{
            
            cellContent.text = textContent
            cellContent.textColor = UIColor(red: 192.0/255, green: 192.0/255, blue: 192.0/255, alpha: 1.0)

        }
        
    }
    
    
    
    override func awakeFromNib() {
        
        
        super.awakeFromNib()
        
    }
    
    
}
