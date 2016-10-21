//
//  BaseTableiewController.swift
//  SwiftDemos
//
//  Created by dajie on 16/1/9.
//  Copyright © 2016年 dajie. All rights reserved.
//

import UIKit

class BaseTableiewController: UITableViewController {
    
    var mainDataArray : [AnyObject]?
    var sectionArray : [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "SwiftDemo"
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cellId")
        mainDataArray = [
            ["Animation" : ["shapeLayer-BarAnimationGarphic", "gradientLayer - GradientLayerAnimation"]] as [String : [String]] as AnyObject,
            ["代理和blcok回传" : ["代理和blcok回传", "XiuXiuAnimation"]] as [String : [String]] as AnyObject
        ]

        sectionArray = ["Animation", "代理和blcok回传"]
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return (sectionArray?.count)!
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let dict = mainDataArray![section] as! [String : AnyObject]
        let arr = dict[sectionArray![section]]
        return arr!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        let dict = mainDataArray![(indexPath as NSIndexPath).section] as! [String : AnyObject]
        let arr = dict[sectionArray![(indexPath as NSIndexPath).section]]
        cell.textLabel?.text = arr![(indexPath as NSIndexPath).row] as? String
        return cell
    }

    // MARK: -TableViewDelegate
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionArray![section] as String
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let dict = mainDataArray![indexPath.section] as! [String : AnyObject]
//        let arr = dict[sectionArray![indexPath.section]]
//        let classStr = arr![indexPath.row] as? String
//        // 根据字符串创建对象
//        let classType = NSClassFromString(classStr!) as? UIViewController.Type
//        if let type = classType {
//            let VC = type.init()
//            navigationController?.pushViewController(VC, animated: true)
//        }
//    }
//        switch indexPath.row
//        {
//        case 0:
//            break
//        default :
//            break
//        }
        if (indexPath as NSIndexPath).section == 0{
            switch (indexPath as NSIndexPath).row{
            case 0:
                 navigationController?.pushViewController(BarAnimationGarphic(), animated: true)
                break
            case 1:
                navigationController?.pushViewController(GradientLayerAnimationViewController(), animated: true)
                break
            default:
                break
            }
        }
        else if (indexPath as NSIndexPath).section == 1{
            switch (indexPath as NSIndexPath).row{
            case 0:
                let deliverVC = UIStoryboard(name: "DeleverController", bundle: Bundle.main).instantiateViewController(withIdentifier: "DeleverController") as! DeleverController
                navigationController?.pushViewController(deliverVC, animated: true)
                break
            case 1:
                let xiuxiuVC = UIStoryboard(name: "XiuXiuAnimation", bundle: Bundle.main).instantiateViewController(withIdentifier: "XiuXiuAnimation") as! XiuXiuAnimation
                navigationController?.pushViewController(xiuxiuVC, animated: true)
                break
            default:
                break
            }
        }
    }
}
