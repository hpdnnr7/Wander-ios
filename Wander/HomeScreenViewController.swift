//
//  HomeScreenViewController.swift
//  Wander
//
//  Created by Hope Dunner on 5/28/21.
//

import UIKit
import Parse

class HomeScreenViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let query = PFQuery(className: "Events")
        query.findObjectsInBackground{ (objects,error) -> Void in
        
            if error == nil
            {
            if let returnedobjects = objects{
                for object in returnedobjects {
                print(object["name"] as! String)
                print(object["date"] as! String)
                print(object["price"] as! String)
                    }
                }
            }
        }
    }
}
