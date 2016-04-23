//
//  XiuXiuAnimation.swift
//  SwiftDemos
//
//  Created by dajie on 16/2/19.
//  Copyright © 2016年 dajie. All rights reserved.
//

import UIKit

class XiuXiuAnimation: UIViewController {

    var baseAnimation : CABasicAnimation?
    var indexCout : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func excutAnimation(sender: UIButton)
    {
        
        let lineLayer = CALayer()
        lineLayer.cornerRadius = view.bounds.size.width
        lineLayer.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width * 2, UIScreen.mainScreen().bounds.size.width * 2)
        lineLayer.position = CGPointMake(UIScreen.mainScreen().bounds.size.width * 0.5, UIScreen.mainScreen().bounds.size.height * 0.5)
        lineLayer.borderWidth = 1
        lineLayer.borderColor = UIColor(red: 18 / 255.0, green: 90 / 255.0, blue: 235 / 255.0, alpha: 0.5).CGColor
        view.layer.addSublayer(lineLayer)
        
        let gradiateLayer = CAGradientLayer()
        gradiateLayer.cornerRadius = view.bounds.size.width
        gradiateLayer.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width * 2 - 1, UIScreen.mainScreen().bounds.size.width * 2 - 1)
        gradiateLayer.position = CGPointMake(UIScreen.mainScreen().bounds.size.width * 0.5, UIScreen.mainScreen().bounds.size.height * 0.5)
        gradiateLayer.colors = [UIColor(red: 18 / 255.0, green: 90 / 255.0, blue: 235 / 255.0, alpha: 0.8).CGColor, UIColor(red: 18 / 255.0, green: 90 / 255.0, blue: 235 / 255.0, alpha: 0.8).CGColor]
        view.layer.addSublayer(gradiateLayer)
        
        baseAnimation = CABasicAnimation()
        baseAnimation!.keyPath = "transform.scale.xy"
        baseAnimation!.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        baseAnimation!.fromValue = 0.15
        baseAnimation!.toValue = 1.0
        baseAnimation!.duration = 2.0
        baseAnimation!.fillMode = kCAFillModeForwards
        
        gradiateLayer.addAnimation(baseAnimation!, forKey: "gradiateLayerAnimation")
        lineLayer.addAnimation(baseAnimation!, forKey: "lineLayerAnimation")
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), {
                gradiateLayer.removeFromSuperlayer()
            })
        
        view.bringSubviewToFront(sender)
    }
}
