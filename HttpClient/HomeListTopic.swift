//
//  HomeListTopic.swift
//  golangClient
//
//  Created by zuojinmin on 2019/3/10.
//  Copyright © 2019 20180807. All rights reserved.
//

import UIKit
import SwiftSoup
struct homeTopicModel {
    var topicTitle:String? // 文章标题
    var auth_name :String?//作者名称
    var auth_homeUrl :String?//作者的主页
    var title :String?
    var title_href :String?
    var time:String?
    var tag_href :String?
    var tag_name:String?
    var read_number:String?//阅读次数
    var topic_content:String?
}
class HomeListTopic: BaseResponse {
    private  var html:String?
    private var items: [homeModel] = []
    private var document :Document?
    public  var objlist:[homeModel]?
    public  var objData:homeTopicModel?
    init(html:String) {
        super.init()
        self.html = html
        htmlparse(data: html)
    }
    
    
    
    func htmlparse (data:String){
        do {
            // content of url
            let html = try data
            // parse it into a Document
            document = try SwiftSoup.parse(html)
            
            // parse css query
            parse()
        } catch let error {
            
            print("出错====",error)
            // an error occurred
            
        }
    }
    
    func parse() {
        do {
            //empty old items
            items = []
            // firn css selector
            print("kaishi=000=======")
            guard  let elements: Elements = try document?.body()?.select("[class=column is-9]") else {
                
                return
            }
            print("kaishi=1111=======",try elements.text())
            print("className==",try elements.first()?.className())
            //transform it into a local object (Item)
            for element in elements {
                print("id===",try element.className())
                print("kaishi=2222=======",try element.text(),element.id())
               
                    print("elent==",try element.className())
                    print("className==",try element.className())
                    guard let text:Elements = try? element.select("[class=title]") else{
                        return
                    }
                    guard let span:Elements = try? element.select("span a") else{
                        return
                    }
                    guard let time:Elements = try? element.select("span time") else{
                        return
                    }
                    guard let read:Elements = try? element.select("[class=metadata] span") else{
                            return
                    }
                guard let conents:Element =  try element.select("[class=media-content]").first() , let content:Elements = try conents.select("[class=content]")   else{
                    return
                }
                    let title = try text.text()
                    print("文章标题====",try text.text())
                    let auth_name = try span.text()
                    print("作者是====",try span.text())
                    let times = try time.text()
                    print("时间是====",try time.text())
                    let read_number = try read.last()?.text()
                    print("浏览数量====",try read.last()?.text())
                    let topic_content = try content.last()?.text()
                
                    print("内容====",try content.last()?.text())
                
                self.objData = homeTopicModel.init(topicTitle: title, auth_name: auth_name, auth_homeUrl: "", title: "", title_href: "", time: times, tag_href: "", tag_name: "", read_number: read_number, topic_content: topic_content)
                for ele in content.last()?.children() ?? Elements(){
                    
                    print("文章内容====",try ele.text())
                }
                
                self.objlist = items
                //               items.append(html)
                
            }
            
        } catch let error {
            print("error==",error)
            //            UIAlertController.showAlert("Error: \(error)", self)
        }
        
        
    }
}
//guard let text:Elements = try? element.select("[class=title] a") else{
//    return
//}
//guard let name:Element = try element.select("[class=metadata] > a").first() else{
//    return
//}
//guard let tag:Element = try element.select("[class=metadata] > a").last() else{
//    return
//}
//guard let time:Elements = try? element.select("time") else{
//    return
//}
//
////                    guard let textherf:Elements = try? element.select("[class=title] a") else{
////                        return
////                    }
//print("imageirl===",try imgUrl.attr("src"))
//print("text=====",try text.text())
//print("text=herf====",try text.attr("href"))
//print("auth=herf====",try name.attr("href"),try name.text())
//print("time=====",try time.text())
//print("tag=herf====",try tag.attr("href"),try tag.text())
//
//items.append(homeModel.init(auth_imageUrl: try imgUrl.attr("src"), auth_name: try name.text(), auth_homeUrl: try name.attr("href"), title: try text.text(), title_href: try text.attr("href"), time: try time.text(), tag_href: try tag.attr("href"), tag_name: try tag.text()))
