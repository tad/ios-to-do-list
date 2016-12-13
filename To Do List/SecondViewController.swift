//
//  SecondViewController.swift
//  To Do List
//
//  Created by Terry Donaghe on 10/4/16.
//  Copyright © 2016 Donaghe. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var txtToDo: UITextField!

    @IBAction func btnAddItem(_ sender: AnyObject) {
        let storedToDoList = UserDefaults.standard.object(forKey: "toDos")
        print(storedToDoList!)
        if let toDoArray = storedToDoList as? NSArray {
            var toDoList = toDoArray as! [String]
            toDoList.append((txtToDo?.text)!)
            UserDefaults.standard.set(toDoList, forKey: "toDos")
            txtToDo.text = ""
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }


}

