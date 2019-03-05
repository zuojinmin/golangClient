//
//  HomeListData.swift
//  golangClient
//
//  Created by zuojinmin on 2019/3/5.
//  Copyright © 2019 20180807. All rights reserved.
//

import UIKit

class HomeListData: NSObject {
    private  var html:String
    
     init(html:String) {
        self.html = html
    }
}

struct homeModel {
    var auth_imageUrl:String?
    var auth_name :String?
    var auth_homeUrl :String?
    var title :String?
    var title_href :String?
    var time:String?
    var tag_href :String?
    var tag_name:String?
    
    
    
    
    
    
}
