//
//  WebViewController.swift
//  Netlfix
//
//  Created by Biken Maharjan on 8/14/17.
//  Copyright © 2017 Biken maharjan. All rights reserved.
//

import UIKit

class WebViewController:UIViewController{
    
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadYoutube(videoID: "watch?v=3Tz9tQr1Zgo")
        navigationItem.title = "Trailer"
        navigationItem.hidesBackButton = true

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "cancel"), style: .plain, target: self, action: #selector(goBack))
        navigationItem.rightBarButtonItem?.tintColor = .white
        
    
    }

    func goBack(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func loadYoutube(videoID:String) {
        guard
            let youtubeURL = URL(string: "https://www.youtube.com/\(videoID)")
            else { return }
        webView.loadRequest( URLRequest(url: youtubeURL) )
    }
    
}
