//
//  RootViewController.swift
//  1604_SNS
//
//  Created by gaokunpeng on 16/9/13.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    //数据源数组
    lazy var dataArray = ["个人资料"]
    
    //表格
    var tbView: UITableView?
    
    //创建表格
    func createTableView() {
        
        automaticallyAdjustsScrollViewInsets = false
        tbView = UITableView(frame: CGRectMake(0, 64, 375, 667-64), style: .Plain)
        tbView?.delegate = self
        tbView?.dataSource = self
        view.addSubview(tbView!)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        title = "主页"
        
        //表格
        createTableView()
        
        view.backgroundColor = UIColor.redColor()
        
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


//MARK: UITableView代理
extension RootViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "cellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId)
        if nil == cell {
            cell = UITableViewCell(style: .Default, reuseIdentifier: cellId)            
        }
        
        cell?.textLabel?.text = dataArray[indexPath.row]
        
        return cell!
    }
    
    //点击事件
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.row == 0 {
            //个人资料
            let ctrl = ProfileViewController()
            //navigationController?.pushViewController(ctrl, animated: true)
            //跟上面的是等价的
            navigationController?.showViewController(ctrl, sender: nil)
        }
        
    }
    
}


