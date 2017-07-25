//
//  BookPageController.swift
//  AMazonLBTA
//
//  Created by Biken maharjan on 7/14/17.
//  Copyright © 2017 Biken Maharjan. All rights reserved.
//

import UIKit

class BookPageController :UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    
    var book:Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        
        // change here for custon UIcollectionViewCell
        collectionView?.register(BookPageCell.self, forCellWithReuseIdentifier: "cellId")
        
        // downcasting
        let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout
        
        layout?.scrollDirection = .horizontal
        
        layout?.minimumLineSpacing = 0

        
        navigationItem.title = self.book?.title
        
        // button close
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(handleCloseBook))
        
    }
    
    // to close the screen of current view and to go back
    func handleCloseBook(){
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    // from delegate to create layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // view.frame is entire screen
        return CGSize(width: view.frame.width, height: view.frame.height - 64)
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // safe unwrapping
        return book?.pages.count ?? 0
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! BookPageCell
        
        // pages is array of page
        let page = book?.pages[indexPath.item]
        
        cell.textLabel.text = page?.text
        
     
        
        return cell
    }
    
    
}
