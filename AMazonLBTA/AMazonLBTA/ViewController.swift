//
//  ViewController.swift
//  AMazonLBTA
//
//  Created by Biken maharjan on 7/13/17.
//  Copyright © 2017 Biken Maharjan. All rights reserved.
//

import UIKit



////////////////////////////////////////////////////////////////////////
class ViewController: UITableViewController {
    
    // all value must be initialize so instead use Book
    var books:[Book]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupNavStyle()
        setupNavBarButton()
        
        // register a class to cellId tableView [withIdentifier]
        tableView.register(BookCell.self, forCellReuseIdentifier: "cellId")
        
        // removes unecessary row in tableView
        tableView.tableFooterView = UIView()
        
        navigationItem.title = "Kindle"
        
        //UIApplication.shared.statusBarStyle = .lightContent
        tableView.backgroundColor = UIColor.lightGray
        
        
        //setupBook()
        fetchBook()

        }
    
    
    //////////[FOOTER]////
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = UIColor(red: 40/225, green: 40/225, blue: 40/225, alpha: 1)
        
     
        // cloud is index 0 and Device is index 1
        let segmentedControl = UISegmentedControl(items: ["Cloud","Device"])
        segmentedControl.tintColor = .white
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        footerView.addSubview(segmentedControl)
//        // anchoring
        segmentedControl.widthAnchor.constraint(equalToConstant: 200).isActive = true
        segmentedControl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        segmentedControl.centerXAnchor.constraint(equalTo: footerView.centerXAnchor).isActive = true
        segmentedControl.centerYAnchor.constraint(equalTo: footerView.centerYAnchor).isActive = true
//        
        
        // data group button 
        
        let gridButton = UIButton(type: .system)
        gridButton.setImage(#imageLiteral(resourceName: "grid"), for: .normal)
        gridButton.translatesAutoresizingMaskIntoConstraints = false
        
        footerView.addSubview(gridButton)
        gridButton.tintColor = .white
        
        gridButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        gridButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        gridButton.centerYAnchor.constraint(equalTo: footerView.centerYAnchor).isActive = true
        gridButton.leftAnchor.constraint(equalTo: footerView.leftAnchor,constant: 8).isActive = true
        
        
        let sortButton = UIButton(type: .system)
        sortButton.setImage(#imageLiteral(resourceName: "Sort"), for: .normal)
        sortButton.translatesAutoresizingMaskIntoConstraints = false
        
        footerView.addSubview(sortButton)
        sortButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        sortButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        sortButton.tintColor = .white
        sortButton.centerYAnchor.constraint(equalTo: footerView.centerYAnchor).isActive = true
        sortButton.rightAnchor.constraint(equalTo: footerView.rightAnchor,constant: -8).isActive = true
        
        return footerView
        
        
        
        
        
    }
    ///////////////////////
    
    func setupNavBarButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu") .withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuPress))
        
       
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "amazon_icon") .withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleAmazonHome))

    }
    
 
   
    func handleMenuPress() {
        // skeleton
        
    }
    
    func handleAmazonHome(){
         // skeleton
    }
    
    func setupNavStyle()
    {
        
        navigationController?.navigationBar.barTintColor = UIColor(red: 40/225, green: 40/225, blue: 40/225, alpha: 1)
        navigationController?.navigationBar.isTranslucent = false
        
        // text of nav bar white
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        
    }
    
    
    // json file
    func fetchBook() {
        
        //1
        print("Fetching Book")
        //url is optional so
        if let url = URL(string:"https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/kindle.json"){
            
            URLSession.shared.dataTask(with: url, completionHandler: {
                (data,response,error) in
                
                if let err = error {
                    print("Error")
                    return
                }
                
                // ways to unwrap if error it will go way of this block of code
                guard let data = data else {return}
                
                // everything goes right then continue from here
                let dataAsString = String(data:data, encoding: .utf8)
                
                do {
                    
                     let json = try JSONSerialization.jsonObject(with: data, options:.mutableContainers)
                    // array of dictionary
                    guard let bookDictionaries = json as? [[String:Any]] else {return}
                    self.books = []
                    for bookDictionary in bookDictionaries {
                        
                        let book = Book(dictionary:bookDictionary)
                        self.books?.append(book)
                        
                    }
                    
                    // back to main thread
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                    
                }catch let jsonError {
                    
                    print("Fail to parse json properly")
                    
                }
               
                
          //3      print(dataAsString)
                
            }).resume()
            
           //2
        }
        
        
    } // end of fetchUp
    
    
//    func setupBook() {
//        
//        let page1 = Page(number: 1, text: "Here is the text")
//        let page2 = Page(number: 2, text: "Another page, This is page no# two")
//        
//        
//        let pages = [page1,page2] //-- (i)
//        let book = Book(title: "Steve Job", author: "Isaac Walterson",pages: pages,image:#imageLiteral(resourceName: "Steve_Jobs"))
//        
//        
//        // for loop to access all the element out of the array [Python style for loop]
//        for page in book.pages {
//            print(page.text)
//        }
//        
//        // inline page construction ---instead of i
//        let book2 = Book(title: "Bill Gates Biography", author: "Michael Becraft", pages: [
//            Page(number: 1, text: "Hxt"),
//            Page(number: 2, text: "Hxt1"),
//            Page(number: 3, text: "Hxt2"),
//            Page(number: 4, text: "Hxt3")
//            ],image:#imageLiteral(resourceName: "bill_gates"))
//        
//        self.books = [book,book2]
//
//        
//    } // static fetch_up for trail
    
    // make table row height from default to 80
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       let book =  books?[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! BookCell
        
        
        
        
        /////////
        // since coverImageView is ImageView type it's has image as an attribute
        // which is default
        // gives me encapsulation
        // Commented are the older code
        //cell.imageView?.image = book?.image
        // new
        //cell.coverImageView.image = book?.image
        //cell.textLabel?.text = book?.title
        //new
        //cell.titleLabel.text = book?.title
        // new
        //cell.authorLabel.text = book?.author
        //////
        
        
        // encapsulation is done by this, book is a property in cell
        cell.book = book
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = books?.count{
            return count
        }
        return 0
        
        
    }
    
    // when user taps into the table view
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let selectedBook = self.books?[indexPath.row]
        // break out the function
    
        
        let layout = UICollectionViewFlowLayout()
        
        // my custom Collection view instantiation <--Binding of pages
        let bookPageController = BookPageController(collectionViewLayout: layout)
        
        
        bookPageController.book = selectedBook
        
        // adding navbar at the top and its child is our custom UICollectionViewCOntroller
        let navController = UINavigationController(rootViewController: bookPageController)
        
        
        
        present(navController, animated: true, completion: nil)
    }

}
////////////////////////////////////////////////////////////////////////

