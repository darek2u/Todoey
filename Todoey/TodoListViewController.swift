//
//  ViewController.swift
//  Todoey
//
//  Created by Dariusz Urbanczyk on 10/03/2019.
//  Copyright © 2019 Dariusz Urbanczyk. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    
    var itemArray = ["Find Mike", "Buy Milk", "Destroy Monster"]
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if  let items = defaults.array(forKey: "TodoListArray") as? [String] {
        itemArray = items
        }
        // Do any additional setup after loading the view, typically from a nib.
    
    }
//MARK - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
        
    }
//MARK - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // print(itemArray[indexPath.row])
        
        // function below tick and unticks "to do" list
        if  tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    

// MARK - Add New Items
    @IBAction func addButttonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert  = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen once the user click the add button on UIAlert
            self.itemArray.append(textField.text!)
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new  item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil )
    }
    
}
