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
        self.navigationController?.navigationBar.isHidden = true
    }
    func setUpViews(){
        self.view.addSubview(naviBar)
        naviBar.snp.makeConstraints { (make) in
          
        make.height.equalTo(UIScreen.statusBarHeight + UIScreen.navigationBarHeight)
        make.left.right.equalToSuperview()
        make.top.equalToSuperview()
        }
        
    }

   

}
extension UIScreen {
    static let width: CGFloat = UIScreen.main.bounds.width
    static let height: CGFloat = UIScreen.main.bounds.height
    static let statusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
    static let navigationBarHeight: CGFloat = 44
}
