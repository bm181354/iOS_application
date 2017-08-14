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
    
    let plot:String = {
        var text = String()
        text = "Bryan Mills (Liam Neeson), a former government operative, is trying to reconnect with his daughter, Kim (Maggie Grace). Then his worst fears become real when sex slavers abduct Kim and her friend shortly after they arrive in Paris for vacation. With just four days until Kim will be auctioned off, Bryan must call on every skill he learned in black ops to rescue her."
        return text
    }()
    
    
    
    //////// add here as wel

}
