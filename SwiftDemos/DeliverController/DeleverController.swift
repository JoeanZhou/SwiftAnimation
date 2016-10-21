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
    
    fileprivate var dataSource:Array<Dictionary<String, String>>?
    fileprivate var selecedIndexPath : IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        mainTableView.contentInset = UIEdgeInsets(top: -64, left: 0, bottom: 0, right: 0)
        creatDataSource()
    }
    
    // MARK: - 创建dataSource
    fileprivate func creatDataSource(){
        
        dataSource = Array<Dictionary<String, String>>()
        
        for i in 0 ..< Int(10){
            dataSource?.append(["name" : "我是第\(i)个元素"])
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataSource?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let tempItem = dataSource![(indexPath as NSIndexPath).row]
        tableViewCell?.textLabel?.text = tempItem["name"]
        return tableViewCell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selecedIndexPath = indexPath
        let editVC = UIStoryboard(name: "EditViewController", bundle: Bundle.main).instantiateViewController(withIdentifier: "eidtVC") as! EditViewController
        editVC.selectedText = dataSource![(indexPath as NSIndexPath).row]["name"]
        editVC.delegte = self
        
    //  MARK: - 利用block进行传值代码, 注意闭包里面只能用self访问属性
    
        editVC.editViewBlock = {
            (name : String) -> () in
            self.dataSource![((self.selecedIndexPath as NSIndexPath?)?.row)!]["name"] = name
            self.mainTableView.reloadRows(at: [self.selecedIndexPath!], with: UITableViewRowAnimation.fade)
        }
        navigationController?.pushViewController(editVC, animated: true)
    }
    
    func modifyName(name: String) {
        
        dataSource![((selecedIndexPath as NSIndexPath?)?.row)!]["name"] = name
        mainTableView.reloadRows(at: [selecedIndexPath!], with: UITableViewRowAnimation.fade)
    }
}

