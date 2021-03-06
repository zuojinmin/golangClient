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
            guard let response:HomeListData = data.value as! HomeListData  else{
                return
            }
            print("objlist===",response.objlist)
            self?.objlist = response.objlist
            self?.tableView.reloadData()
        })
    }
    override func setUpViews() {
        super.setUpViews()
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(naviBar.snp.bottom)
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = self.objlist?[indexPath.row]
        
        HttpClient.default.get(url: WEB_URL_HOME + (data?.title_href  ?? ""), completionHandler: {[weak self](data)in
            //            self.htmlparse(data: data.value?.html ?? "")
            
            guard let response:HomeListTopic = data.value as? HomeListTopic ,response.classForCoder == HomeListTopic.classForCoder()  else{
                return
            }
            print("objdata=============",response.objData)
            self?.navigationController?.pushViewController(HomeContentViewController.init(topicData: response.objData), animated: true)
//            self?.objlist = response.objlist
//            self?.tableView.reloadData()
        })
        
    }

}
