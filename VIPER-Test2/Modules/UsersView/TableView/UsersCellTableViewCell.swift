//
//  UsersCellTableViewCell.swift
//  VIPER-Test2
//
//  Created by Mahmoud on 11/28/22.
//

import UIKit

class UsersCellTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK:- Methods

    
    static func myNib() -> UINib {
        return UINib(nibName: "UsersCellTableViewCell", bundle: nil)
    }
}
