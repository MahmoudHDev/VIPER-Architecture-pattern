//
//  UsersCellTableViewCell.swift
//  VIPER-Test2
//
//  Created by Mahmoud on 11/28/22.
//

import UIKit

class UsersCellTableViewCell: UITableViewCell {
    
    //MARK:- Outlets
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    
    //MARK:- Nib life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    //MARK:- Methods
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    static func myNib() -> UINib {
        
        return UINib(nibName: "UsersCellTableViewCell", bundle: nil)
        
    }
    // Will be called from the tableViewCell
    func setupCell(title: String, subTitle: String) {
        self.title.text     = title
        self.subTitle.text  = subTitle
    }
    
}

