//
//  CollectionCell.swift
//  TableProject
//
//  Created by Biken maharjan on 7/26/17.
//  Copyright © 2017 Biken maharjan. All rights reserved.
//

import UIKit


class CollectionCell: UICollectionViewCell{
    
    @IBOutlet weak var imageView: UIImageView!
    
    var movie:Movies?{
        
        didSet{
            
            print("2")
            if let name =  movie?.name {
                imageView.image = UIImage(named: name)
                //STF
                imageView.contentMode = .scaleToFill
                
            }
            
        }
    }

}
