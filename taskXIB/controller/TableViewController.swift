//
//  TableViewController.swift
//  taskXIB
//
//  Created by Felipe Santos on 18/06/25.
//

import UIKit

class TableViewController: UITableViewController {
    
    let names : [String] = ["Felipe", "João", "Maria", "Carlos", "Ana" ,"Felipe", "João", "Maria", "Carlos", "Ana" ,"Felipe"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        title = "Finalizados"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        self.clearsSelectionOnViewWillAppear = false
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "reuseIdentifier")
        
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! TableViewCell
        
        let name = names[indexPath.row]
        
        cell.label.text = name

        return cell
    }
    
}
