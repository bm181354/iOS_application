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
    fileprivate let cellId:String = "cellId"
    var collectionContent:CollectionCell?
    
    @IBOutlet weak var moviePic: UIImageView!
    @IBOutlet weak var movieLabel: UILabel!
    
    @IBOutlet weak var describe: UILabel!
    
    @IBOutlet weak var addbtn: UIButton!

    
    var movie: Movies?{
        didSet{
            guard let movieN = movie else {return}
            guard let movieName = movieN.name else {return}
            print(movieName)

        }
    }
    
    var plot:String?
    @IBOutlet weak var collection: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
  
        movieLabel.text = movie?.name?.capitalized
        // works
        view.backgroundColor = UIColor(red: 50.0/255, green: 51.0/255, blue: 53.0/255, alpha: 1.0)
        moviePic.image = UIImage(named:(movie?.name)!)

        // navBar logo
        let logo = UIImage(named:"imagess")
        let logoView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        logoView.contentMode = .scaleToFill
        logoView.image = logo
        self.navigationItem.titleView = logoView
        //
        
        describe.textColor = UIColor(red: 0.794, green: 0.794, blue: 0.794, alpha: 0.70)
        navigationItem.hidesBackButton = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "cancel"), style: .plain, target: self, action: #selector(UIWebView.goBack))
        navigationItem.rightBarButtonItem?.tintColor = .white
        // button border
        addbtn.layer.borderWidth = 1.4
        addbtn.layer.borderColor = UIColor(red: 0.355, green: 0.355, blue: 0.555, alpha: 1.00).cgColor
        addbtn.layer.cornerRadius = 5
        describe.text = collectionContent?.plot
        
        collection.backgroundColor = UIColor(red: 50.0/255, green: 51.0/255, blue: 53.0/255, alpha: 1.0)

        
    }
    
    func goBack(){
        self.navigationController?.popViewController(animated: true)
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


extension ShowViewController: UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    
    // Header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
            
        case UICollectionElementKindSectionHeader:
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath)
            
            headerView.backgroundColor = UIColor.blue
            return headerView
            
        case UICollectionElementKindSectionFooter:
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Footer", for: indexPath)
            
            footerView.backgroundColor = UIColor.green
            return footerView
            
        default:
            assert(false, "Unexpected element kind")
        }
    }
   
  
    
    
}
