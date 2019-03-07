//
//  BaseViewController.swift
//  golangClient
//
//  Created by zuojinmin on 2019/3/5.
//  Copyright © 2019 20180807. All rights reserved.
//

import UIKit
import SnapKit
class BaseViewController: UIViewController {

    var naviBar :UIView = {
        let view = UIView()
        view.backgroundColor = R.color.xD73558
        return view
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
       self.setUpViews()
    }
    func setUpViews(){
        self.view.addSubview(naviBar)
        naviBar.snp.makeConstraints { (make) in
           make.height.equalTo(44)
           make.left.right.equalToSuperview()
           make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
        }
        
    }

   

}
