//
//  BookCell.swift
//  AMazonLBTA
//
//  Created by Biken maharjan on 7/14/17.
//  Copyright © 2017 Biken Maharjan. All rights reserved.
//

import UIKit

class BookCell:UITableViewCell {
    
    
    // added for encapsulation 
    // when trigger, this will works as initializer from controller
    var book:Book? {
        didSet {
            //coverImageView.image = book?.image
            titleLabel.text = book?.title
            authorLabel.text = book?.author
            
            guard let coverImageUrl = book?.coverImageUrl else { return }
            
            guard let url = URL(string: coverImageUrl) else {return }
            
            coverImageView.image = nil
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                if let err = error {
                    print("Fail to get the data")
                    return
                }
                guard let imageData = data else {return}
                
                let image = UIImage(data: imageData)
                
                
                
               // print(data)
                
                DispatchQueue.main.async {
                    self.coverImageView.image = image
                }
            }.resume()
        }
    }
    
    
    private let titleLabel:UILabel = {
       
        let label = UILabel()
        label.text = "THIS IS A TEXT dfasdfasdfasdfasdf"
        //label.backgroundColor = .blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private let authorLabel:UILabel = {
       
        let label = UILabel()
        
        label.text = "Author Name"
        //label.backgroundColor = .green
        label.alpha = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
        
    }()
    
    private let coverImageView :UIImageView = {
       
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        
        // anchor // <-- makes anchoring work
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear 
        
        addSubview(coverImageView)
        
        ///// CGRect value into anchor /////
        //x
        coverImageView.leftAnchor.constraint(equalTo: self.leftAnchor,constant:8).isActive = true
        //y
        coverImageView.topAnchor.constraint(equalTo: self.topAnchor,constant:8).isActive = true
        //determines object height [it is dynamic]
        coverImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant:-8).isActive = true
        //object's width
        coverImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        /////////////////////////////////////
        
        addSubview(titleLabel)
        ///// CGRect value into anchor /////
        // x --> [coverImageview] --8point-- [titleLabel]
        titleLabel.leftAnchor.constraint(equalTo: coverImageView.rightAnchor, constant: 8).isActive = true
        
        // [titleLabel]-- 8points --|::Super set boundary
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        
        // height of the object
        titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        // centers the object in the middle of super view w.r.t vertically alignment
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -10).isActive = true
        /////////////////////////////////////

        addSubview(authorLabel)
        ///// CGRect value into anchor /////
        authorLabel.leftAnchor.constraint(equalTo: coverImageView.rightAnchor, constant: 8).isActive = true
        authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3).isActive = true
        authorLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        authorLabel.heightAnchor.constraint(equalToConstant: 20)
        /////////////////////////////////////
        
        
//        label can't be reshape properly [use autolayout -> anchor ]
//        titleLabel.frame = CGRect(x: 66, y: 20, width: 200, height: 20)
//        coverImageView.frame = CGRect(x: 8, y: 8, width: 50, height: 64)
//        authorLabel.frame = CGRect(x: 66, y: 45, width: 150, height: 14)
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }
    
}
