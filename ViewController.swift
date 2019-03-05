//
//  ViewController.swift
//  golangClient
//
//  Created by zuojinmin on 2019/3/5.
//  Copyright © 2019 20180807. All rights reserved.
//

import UIKit
import SwiftSoup
class ViewController: UIViewController {
var items: [String] = []
    var document :Document?
    override func viewDidLoad() {
        super.viewDidLoad()
        HttpClient.default.get(url: "https://www.golangtc.com/", completionHandler: {(data)in
            self.htmlparse(data: data.value?.html ?? "")
            return
        })
        // Do any additional setup after loading the view, typically from a nib.
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
            // an error occurred
            
        }
    }
    
    func parse() {
        do {
            //empty old items
            items = []
            // firn css selector
            guard  let elements: Elements = try document?.body()?.select("article") else {
                return
            }
            //transform it into a local object (Item)
            for element in elements {
                
                if try element.className().contains("media post")  {
                    print("elent==",element.id())
                    print("className==",try element.className())
                    guard let imgUrl:Elements = try? element.select("figure  p  a img") else{
                        return
                    }
                    guard let text:Elements = try? element.select("[class=title] a") else{
                        return
                    }
                    guard let name:Element = try element.select("[class=metadata] > a").first() else{
                        return
                    }
                    guard let tag:Element = try element.select("[class=metadata] > a").last() else{
                        return
                    }
                    guard let time:Elements = try? element.select("time") else{
                        return
                    }
                    
//                    guard let textherf:Elements = try? element.select("[class=title] a") else{
//                        return
//                    }
                    print("imageirl===",try imgUrl.attr("src"))
                    print("text=====",try text.text())
                    print("text=herf====",try text.attr("href"))
                    print("auth=herf====",try name.attr("href"),try name.text())
                    print("time=====",try time.text())
                    print("tag=herf====",try tag.attr("href"),try tag.text())
                    
//                    let text = try element.text()
//                    let html = try element.outerHtml()
//                    print("\ntext===",text)
//                    print("\nhtml===",html)
                }
                
//               items.append(html)
                
            }
            
        } catch let error {
//            UIAlertController.showAlert("Error: \(error)", self)
        }
        
        
    }
}

