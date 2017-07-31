//
//  tableCell.swift
//  TableProject
//
//  Created by Biken maharjan on 7/26/17.
//  Copyright © 2017 Biken maharjan. All rights reserved.
//

import UIKit


class TableCell:UITableViewCell {
    
    // only one thing is stored here 
    var movie = [Movies]()
    
    var movieArray:Movies?{
        didSet{
            self.movie = [movieArray!]
        }
    }
 
     var collectionView:UICollectionView!
    
    
    override func awakeFromNib() {
        print("1")
    }
    

    
}

extension TableCell: UICollectionViewDataSource,UICollectionViewDelegate{
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        print("*********")
        print(movie.count)
       
        // mov only has "Taken inside"

        print("*********")
        return movie.count
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "videoCellId", for: indexPath) as! CollectionCell
  
        print("3")
        cell.movie = self.movie[indexPath.item]
        return cell

        
    
    }
    
    // UICollection
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
        
      //print(movie[indexPath.item].name ?? )
  
        
    }
    
    
    

    
    
    
}
