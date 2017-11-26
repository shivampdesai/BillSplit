//
//  AddPeopleViewController.swift
//  GrocerySplitter
//
//  Created by Shivam Desai on 11/20/17.
//  Copyright © 2017 Shivam Desai. All rights reserved.
//

import UIKit

class AddPeopleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var peopleTable: UITableView!
    
    @IBOutlet weak var peopleText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.peopleTable.allowsMultipleSelection = true
        peopleTable.delegate = self;
        peopleTable.dataSource = self;
        // Do any additional setup after loading the view.
    }

    
    @IBAction func splitbuttonpressed(_ sender: Any) {
        if (grocerylist.count == 0 || peoplelist.count == 0)
        {
            displayAlert(userMessage: "Please make sure that you have added items and people.");
            return;
        }
        performSegue(withIdentifier: "peopletosplit", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (peoplelist.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell!
        
        cell = tableView.dequeueReusableCell(withIdentifier: "peopleCell", for: indexPath)
        cell?.textLabel?.text = peoplelist[indexPath.row]
        
        return cell
    }
    
    @IBAction func addpersonbuttonpressed(_ sender: Any) {
        if ((peopleText.text?.isEmpty)!)
        {
            displayAlert(userMessage: "The text field is empty.");
            return;
        }
        peoplelist.append(peopleText.text!)
        peopletotals.append(0)
        peopleText.text = ""
        peopleTable.reloadData()
    }
    

    @IBAction func HomeButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "AddPeopleToMain", sender: self)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(peoplelist[indexPath.row])  ")
    }
    
    


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func displayAlert(userMessage:String)
    {
        let myAlert = UIAlertController(title: "Oops!", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title:"Okay", style: UIAlertActionStyle.default, handler: nil);
        
        myAlert.addAction(okAction);
        self.present(myAlert, animated: true, completion: nil);
    }
}
