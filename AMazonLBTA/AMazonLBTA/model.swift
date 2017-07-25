//
//  model.swift
//  AMazonLBTA
//
//  Created by Biken maharjan on 7/14/17.
//  Copyright © 2017 Biken Maharjan. All rights reserved.
//

import UIKit

// normal class
class Book{
    
    let title:String
    let author:String
    let pages:[Page]
    //let image:UIImage
    let coverImageUrl:String
    
    // constructor and self to remove ambiguity
//    init(title:String, author:String,pages:[Page],image:UIImage){
//        self.title = title
//        self.author = author
//        self.pages = pages
//        self.image = image
//        self.coverImageUrl = ""
//    }
    
    init(dictionary:[String:Any]) {
        // inline nexted if let statement to unwrap -- shorthand
        self.title = dictionary["title"] as? String ?? " "
        self.author = dictionary["author"] as? String ?? " "
        self.coverImageUrl = dictionary["coverImageUrl"] as? String ?? " "
        
        var bookPages = [Page]()
        
        if let pagesDictionaries = dictionary["pages"] as? [[String:Any]]{
            for pagesDictionary in pagesDictionaries{
                if let pageText = pagesDictionary["text"] as? String {
                let page = Page(number: 0, text: pageText)
                bookPages.append(page)
                }
               
            }
        }
        self.pages = bookPages
        
        //self.image = #imageLiteral(resourceName: "Steve_Jobs")
        
    }
}

class Page{
    
    let number:Int
    let text:String
    
    init(number:Int, text:String) {
        self.number = number
        self.text = text
        
    }
    
}
