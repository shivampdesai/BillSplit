//
//  FinalPageViewController.swift
//  GrocerySplitter
//
//  Created by Shivam Desai on 11/23/17.
//  Copyright © 2017 Shivam Desai. All rights reserved.
//

import UIKit

class FinalPageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var finaltotaltable: UITableView!
    
    @IBOutlet weak var finalpeopletable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        finaltotaltable.delegate = self
        finaltotaltable.dataSource = self
        
        finalpeopletable.delegate = self
        finalpeopletable.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count:Int?
        
        if tableView == self.finalpeopletable
        {
            count = peoplelist.count
        }
        if tableView == self.finaltotaltable
        {
            count = peopletotals.count
        }
        
        return count!
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell?
        
        if tableView == self.finalpeopletable
        {
            cell = tableView.dequeueReusableCell(withIdentifier: "finalpeoplecell", for: indexPath)
            cell?.textLabel?.text = peoplelist[indexPath.row]
        }
        if tableView == self.finaltotaltable
        {
            cell = tableView.dequeueReusableCell(withIdentifier: "finaltotalcell", for: indexPath)
            cell?.textLabel?.text = "$ " + String(peopletotals[indexPath.row])
        }
        
        return cell!
    }
    
    @IBAction func quitbuttonpressed(_ sender: Any) {
        self.performSegue(withIdentifier: "finaltohome", sender: self)
        peopletotals.removeAll()
    }
    
   

}
