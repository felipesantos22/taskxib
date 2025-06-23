//
//  TableViewCell.swift
//  taskXIB
//
//  Created by Felipe Santos on 18/06/25.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var label: UILabel!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Selection
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
