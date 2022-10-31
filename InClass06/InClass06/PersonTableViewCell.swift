//
//  PersonTableViewCell.swift
//  InClass06
//
//  Created by Carlos Del Carpio on 10/12/21.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    @IBOutlet weak var nameOutput: UILabel!
    @IBOutlet weak var stateOutput: UILabel!
    @IBOutlet weak var ageOutput: UILabel!
    @IBOutlet weak var relationshipOutput: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
