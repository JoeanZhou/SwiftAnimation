//
//  EditViewController.swift
//  Swift各种传值
//
//  Created by dajie on 16/2/8.
//  Copyright © 2016年 dajie. All rights reserved.
//

import UIKit

  //  MARK: - 代理
protocol EditViewConteollerDelegate : NSObjectProtocol{
    func modifyName(name name : String)
}

  //  MARK: - 用于传值的block
typealias funcEditBlcok = (String) -> ()

class EditViewController: UIViewController {

    var selectedText : String?
    var editViewBlock : funcEditBlcok?
    
    weak var delegte : EditViewConteollerDelegate?
    
    @IBOutlet weak var textFiled: UITextField!
    @IBOutlet weak var delegateBtn: UIButton!
    @IBOutlet weak var blockBtn: UIButton!
    
    //  MARK: - 代理按钮点击
    @IBAction func delegateBtnClick(sender: UIButton) {
        
        if delegte != nil{
            delegte?.modifyName(name: textFiled.text!)
        }
        navigationController?.popViewControllerAnimated(true)
    }
    
    //  MARK: - block按钮点击
    @IBAction func blockBtnClick(sender: UIButton) {
        
        if let tempBlock = editViewBlock{
            tempBlock(textFiled.text!)
        }
        navigationController?.popViewControllerAnimated(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let tempText = selectedText{
            textFiled.text = tempText
            navigationItem.leftBarButtonItem?.title = tempText
            navigationItem.title = tempText
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        textFiled.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit{
        print("释放了 EditViewController")
    }

}
