//
//  GradientLayerAnimationViewController.swift
//  SwiftDemos
//
//  Created by dajie on 16/1/22.
//  Copyright © 2016年 dajie. All rights reserved.
//

import UIKit

class GradientLayerAnimationViewController: UIViewController{

//    var displayLink : CADisplayLink?
    var gradiationLayer : CAGradientLayer?
    var colors : [CGColorRef]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        displayLink = CADisplayLink(target: self, selector: Selector("changeAnimaiotn"))
//        displayLink!.frameInterval = 6  //  60 / 6 每秒调用10次
//        displayLink?.addToRunLoop(NSRunLoop.currentRunLoop(), forMode: NSRunLoopCommonModes)
        
        view.backgroundColor = UIColor.whiteColor()
        
        gradiationLayer = CAGradientLayer() as CAGradientLayer
        gradiationLayer!.frame = CGRectMake(0, 100, view.bounds.size.width, 50)
        view.layer.addSublayer(gradiationLayer!)
        
        colors = [RGBColor(209.0, green: 0.0, blue:0.0),
            RGBColor(255.0, green: 102.0, blue:34.0),
            RGBColor(255.0, green: 218.0, blue:33.0),
            RGBColor(51.0, green: 221.0, blue:0.0),
            RGBColor(17.0, green: 51.0, blue:204.0),
            RGBColor(34.0, green: 0.0, blue:102.0),
            RGBColor(51.0, green: 0.0, blue:68.0)]
        
        gradiationLayer!.startPoint = CGPointMake(0, 0)
        gradiationLayer!.endPoint = CGPointMake(1, 0)
        gradiationLayer!.colors = colors
        gradiationLayer!.addAnimation(excuteAnimation(colors!), forKey: "GradiationAnimation")
    }
    
   private func RGBColor(r: CGFloat, green: CGFloat, blue: CGFloat) -> CGColorRef{
        return UIColor(red: r / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: 1.0).CGColor
    }
    
    private func excuteAnimation(colors : [CGColorRef]) -> CABasicAnimation{
        let baseAnimation = CABasicAnimation() as CABasicAnimation
        baseAnimation.delegate = self
        baseAnimation.keyPath = "colors"
        baseAnimation.toValue = colors
        baseAnimation.duration = 0.1
        baseAnimation.removedOnCompletion = true;
        baseAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        baseAnimation.fillMode = kCAFillModeForwards
        return baseAnimation
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        changeAnimaiotn()
    }
    
    // MARK - 创建动画
    private func changeAnimaiotn() {
        let lastColor = (colors?.last)! as CGColorRef
        colors?.removeLast()
        colors?.insert(lastColor, atIndex: 0)
        gradiationLayer!.colors = colors
        gradiationLayer!.addAnimation(excuteAnimation(colors!), forKey: "GradiationAnimation")
    }
    
}
