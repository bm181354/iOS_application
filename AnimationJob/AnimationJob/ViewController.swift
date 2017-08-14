//
//  ViewController.swift
//  AnimationJob
//
//  Created by Biken Maharjan on 8/1/17.
//  Copyright © 2017 Biken Maharjan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let color:[UIColor] = [.red,.blue,.yellow,.green,.red,UIColor.darkGray,UIColor.cyan]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        horizontalLine()
        

    }
    
    
    func horizontalLine(){
        for j in 0...15{
            let y_value:Int = j * 50
            for i in 0...10{
                
                let x_value:Int = i * 50
                let frame = CGRect(x: x_value, y: y_value, width: 50, height: 50)
                let boxView = UIView(frame: frame)
                
                boxView.backgroundColor = randomColorPicker()
                view.addSubview(boxView)
                
            }
        }
        
    }
    
    
    func randomColorPicker() -> UIColor{
        
        // 1 to 6
        let index = Int(arc4random_uniform(6) + 1)
        return color[index]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

 
