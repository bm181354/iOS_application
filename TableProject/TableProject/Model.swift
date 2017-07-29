//
//  Model.swift
//  TableProject
//
//  Created by Biken maharjan on 7/27/17.
//  Copyright © 2017 Biken maharjan. All rights reserved.
//

import Foundation

class Movies{
    
    var name:String?
    
    init(name:String) {
        self.name = name
    }
    
    static func fetchUp() ->([Movies],[Movies],[Movies],[Movies]) {
        
        var movieNew=[Movies]()
        var movieOld=[Movies]()
        var movieComedy=[Movies]()
        var movieCopy = [Movies]()
        
        // movie for section 0
        let movie1 = Movies(name: "wolf")
        let movie2 = Movies(name: "ferris")
        let movie3 = Movies(name: "hangover")
        let movie4 = Movies(name: "tale")
        let movie5 = Movies(name: "salt")
        
        // movie for section 1
        let movie6 = Movies(name: "btf")
        let movie7 = Movies(name: "bts")
        let movie8 = Movies(name: "life")
        let movie9 = Movies(name: "btf")
        let movie10 = Movies(name: "salt")
        
        // movie for section 2
        let movie11 = Movies(name: "taken")
        let movie12 = Movies(name: "tale")
        let movie13 = Movies(name: "heist")
        let movie14 = Movies(name: "life")
        let movie15 = Movies(name: "tale")
        
        movieOld.append(movie1)
        movieOld.append(movie2)
        movieOld.append(movie3)
        movieOld.append(movie4)
        movieOld.append(movie5)
        
        movieNew.append(movie6)
        movieNew.append(movie7)
        movieNew.append(movie8)
        movieNew.append(movie9)
        movieNew.append(movie10)
        
        movieComedy.append(movie11)
        movieComedy.append(movie12)
        movieComedy.append(movie13)
        movieComedy.append(movie14)
        movieComedy.append(movie15)
        
        movieCopy.append(movie11)
        movieCopy.append(movie12)
        movieCopy.append(movie13)
        movieCopy.append(movie14)
        movieCopy.append(movie15)
        
        return (movieComedy,movieNew,movieOld,movieCopy)
  
    }
    
    
    
}
