//
//  GradientLayerAnimationViewController.swift
//  SwiftDemos
//
//  Created by dajie on 16/1/22.
//  Copyright © 2016年 dajie. All rights reserved.
//

import UIKit

class GradientLayerAnimationViewController: UIViewController, CAAnimationDelegate{

//    var displayLink : CADisplayLink?
    var gradiationLayer : CAGradientLayer?
    var colors : [CGColor]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        displayLink = CADisplayLink(target: self, selector: Selector("changeAnimaiotn"))
//        displayLink!.frameInterval = 6  //  60 / 6 每秒调用10次
//        displayLink?.addToRunLoop(NSRunLoop.currentRunLoop(), forMode: NSRunLoopCommonModes)
        
        view.backgroundColor = UIColor.white
        
        gradiationLayer = CAGradientLayer() as CAGradientLayer
        gradiationLayer!.frame = CGRect(x: 0, y: 100, width: view.bounds.size.width, height: 50)
        view.layer.addSublayer(gradiationLayer!)
        
        colors = [RGBColor(209.0, green: 0.0, blue:0.0),
            RGBColor(255.0, green: 102.0, blue:34.0),
            RGBColor(255.0, green: 218.0, blue:33.0),
            RGBColor(51.0, green: 221.0, blue:0.0),
            RGBColor(17.0, green: 51.0, blue:204.0),
            RGBColor(34.0, green: 0.0, blue:102.0),
            RGBColor(51.0, green: 0.0, blue:68.0)]
        
        gradiationLayer!.startPoint = CGPoint(x: 0, y: 0)
        gradiationLayer!.endPoint = CGPoint(x: 1, y: 0)
        gradiationLayer!.colors = colors
        gradiationLayer!.add(excuteAnimation(colors!), forKey: "GradiationAnimation")
    }
    
   fileprivate func RGBColor(_ r: CGFloat, green: CGFloat, blue: CGFloat) -> CGColor{
        return UIColor(red: r / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: 1.0).cgColor
    }
    
    fileprivate func excuteAnimation(_ colors : [CGColor]) -> CABasicAnimation{
        let baseAnimation: CABasicAnimation = CABasicAnimation()
        baseAnimation.delegate = self
        baseAnimation.keyPath = "colors"
        baseAnimation.toValue = colors
        baseAnimation.duration = 0.1
        baseAnimation.isRemovedOnCompletion = true;
        baseAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        baseAnimation.fillMode = kCAFillModeForwards
        return baseAnimation
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        changeAnimaiotn()
    }
    
    // MARK - 创建动画
    fileprivate func changeAnimaiotn() {
        let lastColor = (colors?.last)! as CGColor
        colors?.removeLast()
        colors?.insert(lastColor, at: 0)
        gradiationLayer!.colors = colors
        gradiationLayer!.add(excuteAnimation(colors!), forKey: "GradiationAnimation")
    }
    
}
