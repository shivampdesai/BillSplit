//
//  SplitBillViewController.swift
//  GrocerySplitter
//
//  Created by Shivam Desai on 11/23/17.
//  Copyright © 2017 Shivam Desai. All rights reserved.
//

import UIKit



class SplitBillViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var itemLabel: UILabel!
    
    @IBOutlet weak var people1Table: UITableView!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var nextitembutton: UIButton!
    
    var i = 0, j = 0;
    
    var counter:Int = 0;
    var ppp:Float = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.people1Table.allowsMultipleSelection = true;
        
        people1Table.delegate = self;
        people1Table.dataSource = self;
        itemLabel.text = grocerylist[i]
        priceLabel.text = "$" + String(pricelist[i])
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextitembuttonpressed(_ sender: Any) {
        
        if (people1Table.indexPathsForSelectedRows == nil)
        {
            displayAlert(userMessage: "Please select a person.");
            return;
        }
        counter = ((people1Table.indexPathsForSelectedRows)?.count)!
        
        ppp = Float(pricelist[i]) / Float(counter)
        
        
        for j in people1Table.indexPathsForSelectedRows!
        {
            peopletotals[j.row] = peopletotals[j.row] + ppp
            people1Table.deselectRow(at: j, animated: true)
        }
        
        i = i + 1
        
       if (i == grocerylist.count)
       {
        performSegue(withIdentifier: "splittofinal", sender: self)
        }
       else
       {
        itemLabel.text = grocerylist[i]
        priceLabel.text = "$" + String(pricelist[i])
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (peoplelist.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        
        cell = tableView.dequeueReusableCell(withIdentifier: "people1cell", for: indexPath)
        cell?.textLabel?.text = peoplelist[indexPath.row]
        
        return cell
    }
    
    func displayAlert(userMessage:String)
    {
        let myAlert = UIAlertController(title: "Oops!", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title:"Okay", style: UIAlertActionStyle.default, handler: nil);
        
        myAlert.addAction(okAction);
        self.present(myAlert, animated: true, completion: nil);
    }


}
