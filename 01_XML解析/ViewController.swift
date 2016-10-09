//
//  ViewController.swift
//  01_XML解析
//
//  Created by gaokunpeng on 16/9/23.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

/**
 使用GDataXML第三方库解析XML->DOM
 
 1、导入第三方库
 2、不支持ARC,设置编译属性  -fno-objc-arc
 3、导入系统依赖库   libxml2.tbd
 4、设置头文件查找路径  
 build settings -> header search path -> 
   /usr/include/libxml2
 5、加一个桥接头文件
 */

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //1.获取某个节点
        let path = NSBundle.mainBundle().pathForResource("1", ofType: "xml")
        let data = NSData(contentsOfFile: path!)
        
        //GDataXMLDocument -> 对应整个XML文件
        /**
         第一个参数:xml文件的所有数据(二进制数据)
         第二个参数:0
         */
        let doc = try! GDataXMLDocument(data: data!, options: 0)
        
        //XPath语法
        let nodes = try! doc.nodesForXPath("/root/person/name") as! [GDataXMLElement]
        //GDataXML里面的每个节点是GDataXMLElement
//        for ele in nodes {
//            print(ele)
//        }
        
        //2.获取节点的内容
        for ele in nodes {
            let content = ele.stringValue()
            //print(content)
        }
        
        //3.获取子节点
        let personArray = try! doc.nodesForXPath("/root/person") as! [GDataXMLElement]
        for pEle in personArray {
            
            //3.1 获取子节点的第一种方式
            //获取name子节点
            let nameArray = try! pEle.nodesForXPath("name") as! [GDataXMLElement]
            let nameEle = nameArray.last
            //print(nameEle?.stringValue())
            
            //3.2 第二种方法
            let ageArray = pEle.elementsForName("age") as! [GDataXMLElement]
            let ageEle = ageArray.last
            //print(ageEle?.stringValue())
            
        }
        
        //4.获取节点的属性
        for pEle in personArray {
            
            let attrs = pEle.attributes() as! [GDataXMLNode]
            for attrEle in attrs {
                //print(attrEle.stringValue())
            }
            
        }
        
        //5.获取任意位置的某个节点
        let nameArray = try! doc.nodesForXPath("//name") as! [GDataXMLElement]
        for nameEle in nameArray {
            //print(nameEle.stringValue())
        }
        
        //6.获取任意位置的属性值
        let attrArray = try! doc.nodesForXPath("//@id") as! [GDataXMLNode]
        for attr in attrArray {
            print(attr.stringValue())
        }
        
        //7.根节点
        let ele = doc.rootElement()
        print(ele.XMLString())
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

