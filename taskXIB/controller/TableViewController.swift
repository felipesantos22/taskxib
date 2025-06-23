//
//  TableViewController.swift
//  taskXIB
//
//  Created by Felipe Santos on 18/06/25.
//


import UIKit

class TableViewController: UITableViewController {
    
    // MARK: - Properties
    let names: [String] = ["Felipe", "João", "Maria", "Carlos", "Ana"]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Finalizados"
        navigationController?.navigationBar.prefersLargeTitles = true
        clearsSelectionOnViewWillAppear = false
        
        navigationItem.rightBarButtonItem = editButtonItem
        
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        
        let name = names[indexPath.row]
        cell.label.text = name
        
        return cell
    }
}
