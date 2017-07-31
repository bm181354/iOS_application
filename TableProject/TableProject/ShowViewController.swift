//
//  ShowVeiwController.swift
//  TableProject
//
//  Created by Biken maharjan on 7/27/17.
//  Copyright © 2017 Biken maharjan. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController {
    
    // this sound have
    

  
    @IBOutlet weak var movieLabel: UILabel!
 
    
    
    var movie: Movies?{
        didSet{
            guard let movieN = movie else {return}
            guard let movieName = movieN.name else {return}
            
            print(movieName)

        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
  
        movieLabel.text = movie?.name
    }
    
    
    // white status bar
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
