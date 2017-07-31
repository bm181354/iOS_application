//
//  ViewController.swift
//  TableProject
//
//  Created by Biken maharjan on 7/26/17.
//  Copyright © 2017 Biken maharjan. All rights reserved.
//

import UIKit
import Auk

class ViewController: UIViewController,UIScrollViewDelegate {

    var moviesO = [Movies]()
    var moviesN = [Movies]()
    var moviesC = [Movies]()
    var moviesCopy = [Movies]()
    
    @IBOutlet weak var scrollView: UIScrollView!
   // @IBOutlet weak var navBar: UINavigationBar!

    @IBOutlet weak var menuBtn: UIBarButtonItem!
    
    fileprivate var data = ["New Movies","Old Movies","Comedy","Indie"]
    
    @IBOutlet weak var daredevil: UIImageView!
    @IBOutlet weak var anotherCopy: UIImageView!
    @IBOutlet weak var copy2Iimage: UIImageView!
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // navBar logo
        let logo = UIImage(named:"imagess")
        let logoView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        logoView.contentMode = .scaleToFill
        logoView.image = logo
        self.navigationItem.titleView = logoView
        //
        
        
        (moviesO,moviesN,moviesC,moviesCopy) = Movies.fetchUp()
        
        menuBtn.target = revealViewController()
        menuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
        
        //view.backgroundColor = .red
        
        
        //////
        scrollView.delegate = self
        for localImage in DemoConstants.localImages {
            
            
            if let image = UIImage(named: localImage.fileName) {
                scrollView.auk.show(image: image)
            }}
        
        let pageIndex = scrollView.auk.currentPageIndex
        print(pageIndex!)
        
        // style of the scrollsview
        scrollView.auk.settings.contentMode = UIViewContentMode.scaleAspectFill
       
        scrollView.clipsToBounds = false
        
        scrollView.auk.settings.pagingEnabled = true
        self.scrollView.auk.settings.pageControl.backgroundColor = UIColor.black
        scrollView.auk.startAutoScroll(delaySeconds: 7)
        scrollView.auk.scrollToPage(atIndex: 0, animated: true)
        //////
     
    }
    
    // white status bar
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
   

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        

    }
  
}

////////////////////////////////////////////////////////////////////////////////////////////////////////
extension ViewController: UITableViewDelegate,UITableViewDataSource{

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 173
    }
/*  // default header
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data[section]
    }
 */
    // 1 this two method should be
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segwayDetail" {
            guard let vc = (segue.destination as? ShowViewController) else {return}
   
            if let cell = sender as? CollectionCell{
                
                  vc.movie = cell.movie
  
                
                }

            
        }
 
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 41
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
  
     
        let rect = CGRect(x:0,y:0,width:390,height:16)
        let headerView = UIView(frame: rect)
     
        // change this [Make it into center]
        let label = UILabel(frame:CGRect(x:8,y:1,width:250,height:50) )
        label.text = data[section]
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.textColor = .white
        
        headerView.addSubview(label)
        
        // float hence needed to be divided by 255 other else you will get white color 
        headerView.backgroundColor = UIColor(red: 50.0/255 , green: 51.0/255, blue: 53.0/255, alpha: 1.0)
        return headerView
     
    }
    // footer needed both function

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("\n --->\(indexPath.section) \n")
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCellId", for: indexPath) as! TableCell
       
        if indexPath.section == 0{
            cell.movie = moviesN
        }
        else if indexPath.section == 1
        {
            cell.movie = moviesO
        }
        else if indexPath.section == 2
        {
            cell.movie = moviesC
        }
        else if indexPath.section == 3
        {
            cell.movie = moviesCopy
        }
        return cell
        
    }
  
}
/////////////////////////////////////////////////////////////////////

