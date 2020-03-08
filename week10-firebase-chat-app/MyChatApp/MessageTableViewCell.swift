//
//  MessageTableViewCell.swift
//  MyChatApp
//
//  Created by DrKeng on 10/13/2560 BE.
//  Copyright © 2560 ANT. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myChatView: UIView!
    @IBOutlet weak var myChatMessage: UILabel!
    @IBOutlet weak var myChatSender: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
