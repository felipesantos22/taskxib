//
//  TableViewCell.swift
//  taskXIB
//
//  Created by Felipe Santos on 18/06/25.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    // MARK: - Callback
    var switchChanged: ((Bool) -> Void)?
    
    // MARK: - Outlets
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var doneSwitch: UISwitch!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        doneSwitch.addTarget(self, action: #selector(switchToggled(_:)), for: .valueChanged)
    }
    
    @objc private func switchToggled(_ sender: UISwitch) {
        switchChanged?(sender.isOn)
    }
    
    func configure(with task: Task) {
        label.text = task.name
        doneSwitch.isOn = task.isDone
    }
}



  

  
