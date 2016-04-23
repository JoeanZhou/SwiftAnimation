//
//  ViewController.swift
//  Swift各种传值
//
//  Created by dajie on 16/2/8.
//  Copyright © 2016年 dajie. All rights reserved.
//

import UIKit

class DeleverController: UIViewController, UITableViewDataSource, UITableViewDelegate, EditViewConteollerDelegate{

    @IBOutlet weak var mainTableView: UITableView!
    
    private var dataSource:Array<Dictionary<String, String>>?
    private var selecedIndexPath : NSIndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        mainTableView.contentInset = UIEdgeInsets(top: -64, left: 0, bottom: 0, right: 0)
        creatDataSource()
    }
    
    // MARK: - 创建dataSource
    private func creatDataSource(){
        
        dataSource = Array<Dictionary<String, String>>()
        
        for(var i = 0; i < 10; i++){
            dataSource?.append(["name" : "我是第\(i)个元素"])
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataSource?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCellWithIdentifier("cell")
        let tempItem = dataSource![indexPath.row]
        tableViewCell?.textLabel?.text = tempItem["name"]
        return tableViewCell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        selecedIndexPath = indexPath
        let editVC = UIStoryboard(name: "EditViewController", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("eidtVC") as! EditViewController
        editVC.selectedText = dataSource![indexPath.row]["name"]
        editVC.delegte = self
        
    //  MARK: - 利用block进行传值代码, 注意闭包里面只能用self访问属性
    
        editVC.editViewBlock = {
            (name : String) -> () in
            self.dataSource![(self.selecedIndexPath?.row)!]["name"] = name
            self.mainTableView.reloadRowsAtIndexPaths([self.selecedIndexPath!], withRowAnimation: UITableViewRowAnimation.Fade)
        }
        navigationController?.pushViewController(editVC, animated: true)
    }
    
    func modifyName(name name: String) {
        
        dataSource![(selecedIndexPath?.row)!]["name"] = name
        mainTableView.reloadRowsAtIndexPaths([selecedIndexPath!], withRowAnimation: UITableViewRowAnimation.Fade)
    }
}

