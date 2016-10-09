//
//  ProfileViewController.swift
//  1604_SNS
//
//  Created by gaokunpeng on 16/9/14.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        title = "个人资料"
        
        //请求数据
        downloadData()
        
    }
    
    //请求数据
    func downloadData() {
        
        //获取登陆成功状态的token值
        let ud = NSUserDefaults.standardUserDefaults()
        let token = ud.objectForKey("m_auth") as! String
        
        let urlString = "http://10.0.8.8/sns/my/profile.php?m_auth=" + "\(token)"
        
        SNSSessionDownloader.downloadWithUrlString(urlString, finishClosure: {
            (data) in
            
            
        }) {
                (error) in
                    
        }
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
