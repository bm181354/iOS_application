//
//  BookPageCell.swift
//  AMazonLBTA
//
//  Created by Biken maharjan on 7/14/17.
//  Copyright © 2017 Biken Maharjan. All rights reserved.
//

import UIKit

class BookPageCell:UICollectionViewCell {
    
  
    
    let textLabel:UILabel = {
        let label = UILabel()
        
        label.text = "A paragraph is a collection of related sentences dealing with a single topic. Learning to write good paragraphs will help you as a writer stay on track during your drafting and revision stages. Good paragraphing also greatly assists your readers in following a piece of writing. You can have fantastic ideas, but if those ideas aren't presented in an organized fashion, you will lose your readers (and fail to achieve your goals in writing)."
        
        label.translatesAutoresizingMaskIntoConstraints = false
        // makes paragraph
        label.numberOfLines = 0
        
        return label
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        addSubview(textLabel)
        //textLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
        textLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        textLabel.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 10).isActive = true
        textLabel.rightAnchor.constraint(equalTo: self.rightAnchor,constant : -10).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
