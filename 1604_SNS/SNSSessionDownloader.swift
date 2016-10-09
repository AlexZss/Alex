//
//  SNSSessionDownloader.swift
//  1604_SNS
//
//  Created by gaokunpeng on 16/9/14.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class SNSSessionDownloader: NSObject {
    
    //闭包封装的下载方法
    //var finishClosure: (NSData -> Void)?
    //var failClosure: (NSError -> Void)?
    
    class func downloadWithUrlString(urlString: String, finishClosure: (NSData -> Void), failClosure: (NSError -> Void)) {
        
        //1.创建NSURL对象
        let url = NSURL(string: urlString)
        //2.创建NSURLRequest对象
        let request = NSURLRequest(URL: url!)
        //3.创建NSURLSession
        let session = NSURLSession.sharedSession()
        //4.创建NSURLSessionDataTask
        let task = session.dataTaskWithRequest(request) {
            (data, response, error) in
            
            if let tmpError = error {
                //下载出错
                failClosure(tmpError)
            }else{
                
                let httpReponse = response as! NSHTTPURLResponse
                if httpReponse.statusCode == 200 {
                    //下载数据完成
                    finishClosure(data!)
                }else{
                    let myError = NSError(domain: urlString, code: httpReponse.statusCode, userInfo: ["msg": "下载失败"])
                    failClosure(myError)
                }
                
            }
            
        }
        
        //5.开启任务
        task.resume()
        
        
    }
    
    

}
