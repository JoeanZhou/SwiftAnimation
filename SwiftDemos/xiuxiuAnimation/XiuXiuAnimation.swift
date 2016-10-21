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
    
    @IBAction func excutAnimation(_ sender: UIButton)
    {
        
        let lineLayer = CALayer()
        lineLayer.cornerRadius = view.bounds.size.width
        lineLayer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width * 2, height: UIScreen.main.bounds.size.width * 2)
        lineLayer.position = CGPoint(x: UIScreen.main.bounds.size.width * 0.5, y: UIScreen.main.bounds.size.height * 0.5)
        lineLayer.borderWidth = 1
        lineLayer.borderColor = UIColor(red: 18 / 255.0, green: 90 / 255.0, blue: 235 / 255.0, alpha: 0.5).cgColor
        view.layer.addSublayer(lineLayer)
        
        let gradiateLayer = CAGradientLayer()
        gradiateLayer.cornerRadius = view.bounds.size.width
        gradiateLayer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width * 2 - 1, height: UIScreen.main.bounds.size.width * 2 - 1)
        gradiateLayer.position = CGPoint(x: UIScreen.main.bounds.size.width * 0.5, y: UIScreen.main.bounds.size.height * 0.5)
        gradiateLayer.colors = [UIColor(red: 18 / 255.0, green: 90 / 255.0, blue: 235 / 255.0, alpha: 0.8).cgColor, UIColor(red: 18 / 255.0, green: 90 / 255.0, blue: 235 / 255.0, alpha: 0.8).cgColor]
        view.layer.addSublayer(gradiateLayer)
        
        baseAnimation = CABasicAnimation()
        baseAnimation!.keyPath = "transform.scale.xy"
        baseAnimation!.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        baseAnimation!.fromValue = 0.15
        baseAnimation!.toValue = 1.0
        baseAnimation!.duration = 2.0
        baseAnimation!.fillMode = kCAFillModeForwards
        
        gradiateLayer.add(baseAnimation!, forKey: "gradiateLayerAnimation")
        lineLayer.add(baseAnimation!, forKey: "lineLayerAnimation")
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(2.0 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: {
                gradiateLayer.removeFromSuperlayer()
            })
        
        view.bringSubview(toFront: sender)
    }
}
