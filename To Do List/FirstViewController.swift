//
//  FirstViewController.swift
//  To Do List
//
//  Created by Terry Donaghe on 10/4/16.
//  Copyright © 2016 Donaghe. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblView: UITableView!
    var toDoList = [String]()
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count;
    }
    
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = toDoList[indexPath.row]
        
        return cell

    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadTable()
    }


    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    internal func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            // delete data and row
            
            let storedToDoList = UserDefaults.standard.object(forKey: "toDos")
            if let toDoArray = storedToDoList as? NSArray {
                var toDos = toDoArray as! [String]
                toDos.remove(at: indexPath.row)
                UserDefaults.standard.set(toDos, forKey: "toDos")
                toDoList = toDos
                loadTable()
            }
            
        }
    }
    
    internal func loadTable() {
        let storedToDoArray = UserDefaults.standard.object(forKey: "toDos")
        
        print(storedToDoArray)
        
        if let toDoArray = storedToDoArray as? NSArray {
            print("STUFF!!!")
            toDoList = toDoArray as! [String]
            print(toDoList)
        } else {
            print("NO STUFF!!")
            UserDefaults.standard.set(toDoList, forKey: "toDos")
        }
        
        self.tblView.reloadData()
    }


}

