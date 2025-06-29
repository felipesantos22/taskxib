//
//  HomeViewController.swift
//  taskXIB
//
//  Created by Felipe Santos on 19/06/25.
//

import UIKit
import CoreData

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    var task: [Task] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // MARK: - Outlets
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var table: UITableView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Lista de Tarefas"
        navigationController?.navigationBar.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 32, weight: .bold)
        ]
        
        //navigationController?.navigationBar.prefersLargeTitles = true
        
        //table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        table.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "reuseIdentifier")
        
        textField.delegate = self
        textField.clearButtonMode = .whileEditing
        
        table.dataSource = self
        table.delegate = self
        
        fetchTask()
        
    }
    
    
    // MARK: - Actions
    @IBAction func button(_ sender: UIButton) {
        guard let text = textField.text, !text.isEmpty else { return }
        saveTask(name: text)
        fetchTask()
        textField.text = ""
    }
    
    // MARK: - Core Data
    func fetchTask() {
        do {
            task = try context.fetch(Task.fetchRequest())
            table.reloadData()
        } catch {
            print("Fetch Error: \(error)")
        }
    }
    
    func saveTask(name: String) {
        let task = Task(context: context)
        task.name = name
        task.isDone = false
        do {
            try context.save()
        } catch {
            print("Save Error: \(error)")
        }
    }
    
}

// MARK: - UITableViewDataSource & UITableViewDelegate
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int { 1 }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return task.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        
        let currentTask = task[indexPath.row]
        cell.configure(with: currentTask)
        
        // Callback do switch
        cell.switchChanged = { [weak self] isOn in
            guard let self = self else { return }
            currentTask.isDone = isOn
            do {
                try self.context.save()
                print("Atualizado: \(currentTask.name ?? "") -> \(isOn)")
            } catch {
                print("Erro ao salvar: \(error)")
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let taskToDelete = task[indexPath.row]
            context.delete(taskToDelete)
            do {
                try context.save()
                task.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            } catch {
                print("Delete Error: \(error)")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        //
    }
}

// MARK: - UITextFieldDelegate
extension HomeViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
}
