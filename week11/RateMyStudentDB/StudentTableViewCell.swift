//
//  StudentTableViewCell.swift
//  RateMyStudentDB
//
//  Created by ANT Man on 7/9/2562 BE.
//  Copyright © 2562 MO/IO. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var timeOutlet: UILabel!
    @IBOutlet weak var stuNameOutlet: UILabel!
    @IBOutlet weak var stuContentOutlet: UILabel!
    @IBOutlet weak var stuPictureOutlet: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
