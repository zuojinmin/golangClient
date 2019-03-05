//
//  HomeViewController.swift
//  golangClient
//
//  Created by zuojinmin on 2019/3/5.
//  Copyright © 2019 20180807. All rights reserved.
//

import UIKit



class HomeViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    

    var tableView :UITableView = {
        let table = UITableView()
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func setUpViews() {
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.right.bottom.equalToSuperview()
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HomeCell.classForCoder(), forCellReuseIdentifier: HomeCell.Identifier())
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeCell.Identifier(), for: indexPath)
//        tableView.dequeueReusableCell(withIdentifier: HomeCell.Identifier())
        return cell
    }

}
