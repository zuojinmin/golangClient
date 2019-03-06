//
//  HomeViewController.swift
//  golangClient
//
//  Created by zuojinmin on 2019/3/5.
//  Copyright © 2019 20180807. All rights reserved.
//

import UIKit



class HomeViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    var objlist : [homeModel]?

    var tableView :UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.request()
        self.view.backgroundColor = R.color.xF5F5F5
    }
    
    func request()  {
        HttpClient.default.get(url: "https://www.golangtc.com/", completionHandler: {[weak self](data)in
//            self.htmlparse(data: data.value?.html ?? "")
            print("objlist===",data.value?.objlist)
            self?.objlist = data.value?.objlist
            self?.tableView.reloadData()
        })
    }
    override func setUpViews() {
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HomeCell.classForCoder(), forCellReuseIdentifier: HomeCell.Identifier())
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.objlist?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : HomeCell = tableView.dequeueReusableCell(withIdentifier: HomeCell.Identifier(), for: indexPath) as! HomeCell
        cell.loadData(data: self.objlist?[indexPath.row])
//        tableView.dequeueReusableCell(withIdentifier: HomeCell.Identifier())
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

}
