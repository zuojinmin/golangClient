//
//  HomeContentViewController.swift
//  golangClient
//
//  Created by zuojinmin on 2019/3/7.
//  Copyright © 2019 20180807. All rights reserved.
//

import UIKit

class HomeContentViewController: BaseViewController {
    var data:homeTopicModel?
    var titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "PingFangSC-Semibold", size: 16)
        label.textColor = R.color.x3A3D50
        label.textAlignment = .left
        label.numberOfLines = 0
//        label.sizeToFit()
        return label
    }()
    var contentlabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "PingFangSC-Semibold", size: 12)
        label.textColor = R.color.xADADAD
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
     init(topicData:homeTopicModel?) {
        super.init(nibName: nil, bundle: nil)
        self.data = topicData
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setUpViews() {
        super.setUpViews()
        self.view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.naviBar.snp.bottom)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.height.equalTo(80)
        }
        self.view.addSubview(contentlabel)
        contentlabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.text = self.data?.topicTitle
        self.contentlabel.text = self.data?.topic_content
        // Do any additional setup after loading the view.
    }
    

}
