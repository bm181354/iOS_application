// This function creates a table view. 
/*
  Protocol need UITableView[DataSource/Delegate] 
  + numberOfRowsInSection[tableView] : number of row in a table usually
    data.count [In java, length(data)]
  + cellForRowAt [tableView]:where we set the identifier for the prototype cell
    and also use index gotten as index with data[indexPath.row]
  + just like in pickView we need to reference its dataSource and delegate in viewDidload()
    function  
*/
////////////////////////////////////////////////////////////////////////////   
    let data = ["Addidas","Nike","Puma","New Balance","Reebok","Armour","Generic"]
    
    //private let simpleTableIndentifier = "SimpleTableIdentifier"
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        
        return data.count
        
    }
    
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "viewCell", for: indexPath )
        
        cell.textLabel?.text = data[indexPath.row]
        
        return cell
        
   
    }
    
    
    // When back button is pressed w/o using stack memory
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
//////////////////////////////////////////////////////////////////////////////
