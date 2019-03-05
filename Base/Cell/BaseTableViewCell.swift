//
//  BaseTableViewCell.swift
//  golangClient
//
//  Created by zuojinmin on 2019/3/5.
//  Copyright © 2019 20180807. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.accessoryType = .none
        self.setUpViews()
        // Initialization code
    }
    func setUpViews(){
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   class  func Identifier() -> String {
        return ""
    }

}
