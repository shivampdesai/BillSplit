//
//  AddItemViewController.swift
//  GrocerySplitter
//
//  Created by Shivam Desai on 11/19/17.
//  Copyright © 2017 Shivam Desai. All rights reserved.
//

import UIKit


class AddItemViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var itemtext: UITextField!
    
    @IBOutlet weak var priceTable: UITableView!
    
    
    @IBOutlet weak var pricetext: UITextField!
    
    @IBOutlet weak var itemTable: UITableView!

    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        itemTable.dataSource = self
        itemTable.delegate = self
        
        
        priceTable.dataSource = self
        priceTable.delegate = self
       
        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count:Int?
        
        if tableView == self.itemTable
        {
            count = grocerylist.count
        }
        if tableView == self.priceTable
        {
            count = pricelist.count
        }
        
        return count!
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell?
        
        if tableView == self.itemTable
        {
            cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
            cell?.textLabel?.text = grocerylist[indexPath.row]
        }
        if tableView == self.priceTable
        {
            cell = tableView.dequeueReusableCell(withIdentifier: "priceCell", for: indexPath)
            cell?.textLabel?.text = String(pricelist[indexPath.row])
        }
        
        return cell!
    }
    
    
    @IBAction func additembuttonpressed(_ sender: Any)
    {
        if ((itemtext.text?.isEmpty)! || ((pricetext.text?.isEmpty)!)) //makes sure both textfields have information
        {
            displayAlert(userMessage: "One or more text fields are empty.");
            itemtext.text = ""
            pricetext.text = ""
            return;
        }
        
        if (Float(pricetext.text!)) == nil //makes sure that price text field has a float number
        {
            displayAlert(userMessage: "Price must be a number.");
            pricetext.text = ""
            return;
        }
        grocerylist.append(itemtext.text!)          //appends new item to existing grocerylist arrayappend
        pricelist.append(Float(pricetext.text!)!)   //appends new price to corresponding price array
        itemTable.reloadData()                      //refreshes table after array is appended
        priceTable.reloadData()
        itemtext.text = ""                          //clears info in the text field
        pricetext.text = ""
        
    }

func AddItemstoMain(_ sender: Any) {
        self.performSegue(withIdentifier: "AddItemtoHome", sender: self)
    }
    
    func AddItemToAddPeople(_ sender: Any) {
        if (grocerylist.count < 1) //makes sure that grocerylist array is populated before moving onto next step
        {
            displayAlert(userMessage: "Please add an item."); //error message
            return;
        }
        else
        {
        self.performSegue(withIdentifier: "AddItemToAddPeople", sender: self) //if grocerylist is populated, moves to next view controller
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)   //if any part of screen is touched, resigns the keyboard
    }
    
    func displayAlert(userMessage:String) //function to display message
    {
        let myAlert = UIAlertController(title: "Oops!", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title:"Okay", style: UIAlertActionStyle.default, handler: nil);
        
        myAlert.addAction(okAction);
        self.present(myAlert, animated: true, completion: nil);
    }
}

