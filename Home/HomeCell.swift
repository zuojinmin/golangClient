//
//  HomeCell.swift
//  golangClient
//
//  Created by zuojinmin on 2019/3/5.
//  Copyright © 2019 20180807. All rights reserved.
//

import UIKit
import SDWebImage
class HomeCell: BaseTableViewCell {

    var bgView :UIView = {
        let view = UIView()
        view.backgroundColor = R.color.xFFFFFF
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    
    var imageV:UIImageView = {
        let imgV = UIImageView()
        imgV.backgroundColor = UIColor.red
        imgV.layer.cornerRadius = 15
        imgV.layer.borderWidth = 1
        imgV.layer.borderColor = UIColor.gray.cgColor
        imgV.clipsToBounds = true
        return imgV
    }()
    var titleLabel :UILabel = {
        let label = UILabel()
        label.textColor = UIColor.green
        label.text = "title"
        
        return label
        
    }()
    var authLabel :UILabel = {
        let label = UILabel()
        label.textColor = UIColor.orange
        label.text = "title"
        label.sizeToFit()
        return label
    }()
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setUpViews()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpViews()
        
        
    }
    
    func loadData(data:homeModel?)  {
        self.titleLabel.text = data?.title
        self.imageV.sd_setImage(with: URL.init(string: data?.auth_imageUrl ?? ""), completed: nil)
        self.authLabel.text = data?.auth_name
//        self.imageV.
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setUpViews() {
        super.setUpViews()
        self.addSubview(bgView)
        bgView.addSubview(imageV)
        bgView.addSubview(titleLabel)
        bgView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(7.5)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-5)
        }
        imageV.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(0)
            make.centerY.equalToSuperview()
//            make.top.bottom.equalToSuperview()
            make.width.height.equalTo(30)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(imageV.snp.right).offset(10)
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(30)
        }
        bgView.addSubview(authLabel)
        authLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom)
            make.left.equalTo(titleLabel)
            make.height.equalTo(20)
        }
        self.backgroundColor = R.color.xF5F5F5
    
    }
    
    override class  func Identifier() -> String {
        return "HomeCell"
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
