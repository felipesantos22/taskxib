//
//  TableViewController.swift
//  taskXIB
//
//  Created by Felipe Santos on 18/06/25.
//


import UIKit
import CoreData

class TableViewController: UITableViewController {
    
    // MARK: - Core Data Context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // MARK: - Properties
    var task: [Task] = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Finalizados"
        navigationController?.navigationBar.prefersLargeTitles = true
        clearsSelectionOnViewWillAppear = false
        navigationItem.rightBarButtonItem = editButtonItem
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "reuseIdentifier")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchTask()
    }
    
    // MARK: - Core Data Methods
    func fetchTask() {
        do {
            task = try context.fetch(Task.fetchRequest())
            tableView.reloadData()
        } catch {
            print("Fetch Error: \(error)")
        }
    }
    
    // MARK: - Table View Data Source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return task.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        
        let tasks = task[indexPath.row]
        cell.label.text = tasks.name
        
        return cell
    }
    
    // MARK: - Table View Delegate (Editing)
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let deleteTask = task[indexPath.row]
            context.delete(deleteTask)
            do {
                try context.save()
                task.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            } catch {
                print("Erro ao deletar tarefa: \(error.localizedDescription)")
            }
        }
    }
}
