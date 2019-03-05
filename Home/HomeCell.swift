//
//  HomeCell.swift
//  golangClient
//
//  Created by zuojinmin on 2019/3/5.
//  Copyright © 2019 20180807. All rights reserved.
//

import UIKit

class HomeCell: BaseTableViewCell {

    var imageV:UIImageView = {
        let imgV = UIImageView()
        return imgV
    }()
    var titleLabel :UILabel = {
        let label = UILabel()
        label.textColor = UIColor.green
        label.text = "title"
        return label
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setUpViews() {
        super.setUpViews()
        self.addSubview(imageV)
        self.addSubview(titleLabel)
        imageV.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
            make.top.bottom.equalToSuperview()
            make.width.equalTo(30)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(imageV.snp.right).offset(10)
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(30)
        }
    }
    
    override class  func Identifier() -> String {
        return "HomeCell"
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
