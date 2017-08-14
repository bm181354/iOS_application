//
//  ViewController.swift
//  AnimationPopCircle
//
//  Created by Biken Maharjan on 7/30/17.
//  Copyright © 2017 Biken Maharjan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var plusBtn: UIButton!
    // initialization
    override func viewWillAppear(_ animated: Bool) {

        makeHiddenCircle()
        makeBtnHide()
        label.alpha = 0
      
        // after this autolayout is called ??
        
    }
    
    func makeBtnHide(){
        
        btn1.center = plusBtn.center
        btn2.center = plusBtn.center
        btn3.center = plusBtn.center
        
        btn1.alpha = 0
        btn2.alpha = 0
        btn3.alpha = 0
        
    }
    
    func makeBtnAppear(){
        
        
        btn1.center = CGPoint(x: 286 + 80, y: 486 + 80)
        btn2.center = CGPoint(x: 272, y: 635)
        btn3.center = CGPoint(x: 255, y: 719)
        
        btn1.alpha = 1
        btn2.alpha = 1
        btn3.alpha = 1
        
    }
    
    
    func makeCircle() {
        
        circleView.frame.size.height = 328
        circleView.frame.size.width = 328
        circleView.layer.cornerRadius = circleView.frame.height / 2
        circleView.layer.masksToBounds = true
        circleView.backgroundColor = .red
        circleView.center.x = plusBtn.center.x //+ 27
        circleView.center.y = plusBtn.center.y //+ 57
        
    }
    
    func makeHiddenCircle() {
        
        circleView.frame.size.height = 1
        circleView.frame.size.width = 1
        circleView.layer.cornerRadius = circleView.frame.height / 2
        circleView.backgroundColor = .red
        circleView.center.x = plusBtn.center.x //+ 27
        circleView.center.y = plusBtn.center.y //+ 57
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 0.3, delay: 1, options: [.curveEaseOut], animations: {
            self.label.alpha = 1
            self.label.text = "A"
            
        }) { (true) in
            UIView.animate(withDuration: 0.3, delay: 1, options: [.curveEaseOut], animations: {
                self.label.text = "B"
            }, completion: { (true) in
            
                
               UIView.animate(withDuration: 0.3, delay: 1, options: [.curveEaseOut], animations: { 
                   self.label.text = "C"
               }, completion: nil)
                
            })
        }
        
        
    }

    
    @IBAction func pressedPlusBtn(_ sender: UIButton) {
        
        if sender.isSelected{
                UIView.animate(withDuration: 0.3, delay: 0.1, options: [.curveEaseOut], animations: {
                    self.makeCircle()

                }, completion: nil)
                UIView.animate(withDuration: 0.3, delay: 0.2, options: [.curveEaseOut], animations: {
                self.makeBtnAppear()
                }, completion: nil)

            sender.isSelected = false
  
        }
        else{
            UIView.animate(withDuration: 0.3, delay: 0.1, options: [.curveEaseOut], animations: {
                self.makeHiddenCircle()
                
                
            }, completion: nil)
            UIView.animate(withDuration: 0.3, delay: 0.2, options: [.curveEaseOut], animations: {
                
                self.makeBtnHide()
                
            }, completion: nil)
            
            
            
           sender.isSelected = true
        }
 
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    

    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

