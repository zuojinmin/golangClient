//
//  HttPclient.swift
//  golangClient
//
//  Created by zuojinmin on 2019/3/5.
//  Copyright © 2019 20180807. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
let WEB_URL_HOME = "https://www.golangtc.com"
let WEB_URL_TOPIC = "https://www.golangtc.com/t/"
//用户代理，使用这个切换是获取 m站点 还是www站数据
let USER_AGENT = "Mozilla/5.0 (iPhone; CPU iPhone OS 12_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16B91"
let ACCEPT =  "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"
let MOBILE_CLIENT_HEADERS = ["user-agent":USER_AGENT,"Accept":ACCEPT]
class HttpClient: NSObject {

    static let `default` = HttpClient()
    
    private var manager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 15 * 3
        configuration.timeoutIntervalForResource = 15 * 3
        return SessionManager(configuration: configuration)
        
    }()

    
    func get(url:String,completionHandler: @escaping (DataResponse<BaseResponse>) -> Void)  {
        let url = url
        let header = MOBILE_CLIENT_HEADERS
        self.manager.request(url,  headers: header).responseHtml { (res) in
            completionHandler(res)
        }
    }
    
}

class HtmlData {
    var data :Array<Any>?
    var html:String?
    
     init() {
        
    }
}

extension DataRequest {
    
//   static func JIHTMLResponseSerializer() -> DataResponseSerializer<BaseResp>{
//        return DataResponseSerializer{request, response, data, error in
//            return .success("")
//        }
//    }
    
    static func JIHTMLResponseSerializer() -> DataResponseSerializer<BaseResponse> {
        return DataResponseSerializer { request, response, data, error in
          //请求为topic 内容
            if request?.url?.absoluteString.contains(WEB_URL_TOPIC) ?? false {
                let response = HomeListTopic(html: String.init(data: data ?? Data(), encoding: String.Encoding.utf8) ?? "")
                
                return .success(response)
                
            }

        let response = HomeListData(html: String.init(data: data ?? Data(), encoding: String.Encoding.utf8) ?? "")

          return .success(response)
        }
    }
    
    @discardableResult
    func responseHtml(queue: DispatchQueue? = nil, completionHandlerHtml: @escaping (DataResponse<BaseResponse>) -> Void) -> Self {
        
        return response(responseSerializer: Alamofire.DataRequest.JIHTMLResponseSerializer(), completionHandler: completionHandlerHtml)
    }
}

//import Alamofire
//
//extension Error {
//    var localizedFailureReason :String? {
//        return (self as NSError).localizedFailureReason
//    }
//}
//extension DataRequest {
//    enum ErrorCode: Int {
//        case noData = 1
//        case dataSerializationFailed = 2
//    }
//    internal static func newError(_ code: ErrorCode, failureReason: String) -> NSError {
//        let errorDomain = "me.fin.v2ex.error"
//        let userInfo = [NSLocalizedFailureReasonErrorKey: failureReason]
//        let returnError = NSError(domain: errorDomain, code: code.rawValue, userInfo: userInfo)
//        return returnError
//    }
//
//    static func JIHTMLResponseSerializer() -> DataResponseSerializer<Ji> {
//        return DataResponseSerializer { request, response, data, error in
//            guard error == nil else { return .failure(error!) }
//
//            if response?.url?.path == "/signin" && request?.url?.path != "/signin" {
//                //跳转到登录页时，则证明请求的内容需要登录
//                let failureReason = "查看的内容需要登录!"
//                let error = newError(.dataSerializationFailed, failureReason: failureReason)
//                return .failure(error)
//            }
//            guard let validData = data else {
//                return .failure(AFError.responseSerializationFailed(reason: .inputDataNil))
//            }
//
//            if  let jiHtml = Ji(htmlData: validData){
//                return .success(jiHtml)
//            }
//
//            let failureReason = "ObjectMapper failed to serialize response."
//            let error = newError(.dataSerializationFailed, failureReason: failureReason)
//            return .failure(error)
//        }
//    }
//
//    @discardableResult
//    public func responseJiHtml(queue: DispatchQueue? = nil,  completionHandler: @escaping (DataResponse<Ji>) -> Void) -> Self {
//        return response(responseSerializer: Alamofire.DataRequest.JIHTMLResponseSerializer(), completionHandler: completionHandler);
//    }
//}
