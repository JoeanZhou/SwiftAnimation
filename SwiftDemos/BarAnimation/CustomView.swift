//
//  CustomView.swift
//  SwiftAnimation
//
//  Created by dajie on 15/12/24.
//  Copyright © 2015年 dajie. All rights reserved.
//

import UIKit

class CustomView: UIView {
    
    var count : [CGFloat]?
    var animationDuration : CFTimeInterval?
    
    /**
     set up UI and animation for view
     
     - parameter progress1:          progress
     - parameter animationDuration1: animation durarion time
     */
    func shapeLayerValue(animationDuration1 animationDuration1 : CFTimeInterval, count1 : [CGFloat]){
        count = count1
        animationDuration = animationDuration1
        
        var originalY : CGFloat = 10
        for var i = 0; i < count1.count; ++i{
        
            addShapeLayer(position: originalY, progress : count![i])
            addLabel(position : originalY - 7, progress : count![i])
            originalY += 20
        }
    }
    
    /**
     add a progress lable to view
     */
    private func addLabel(position position : CGFloat, progress : CGFloat){
        let lable = UILabel(frame: CGRectMake(0, position, 0, 0))
        lable.text = "\(progress * 100)%"
        lable.font = UIFont.systemFontOfSize(12.0)
        lable.sizeToFit()
        lable.layer.addAnimation(addSharpLayerAnimation(keypath: "transform.translation.x", tovalue: frame.size.width * progress + 5), forKey: "translationAnimation")
        addSubview(lable)
        
    }
    
    /**
     to add a shapeLayer to layer and excute a animation for layer
     */
    private func addShapeLayer(position position : CGFloat, progress : CGFloat){
        let shapeLayer : CAShapeLayer = CAShapeLayer()
        shapeLayer.lineWidth = 10
        shapeLayer.strokeColor = UIColor.blueColor().CGColor
        shapeLayer.path = shapeLayerPath(position: position, progress: progress).CGPath
        shapeLayer.addAnimation(addSharpLayerAnimation(keypath : "strokeEnd", tovalue : 1.0), forKey: "storkeEndAnimation")
        layer.addSublayer(shapeLayer)
    }
    
    /**
     add Animation for shapeLayer
     
     - returns: CABaseanimation
     */
    private func addSharpLayerAnimation(keypath keypath : String, tovalue : AnyObject?) -> CABasicAnimation{
        
        let shapeLayerBaseAnimation = CABasicAnimation(keyPath: keypath)
        shapeLayerBaseAnimation.fromValue = 0.0
        shapeLayerBaseAnimation.toValue = tovalue
        shapeLayerBaseAnimation.duration = 1.25
        shapeLayerBaseAnimation.repeatCount = 10
        shapeLayerBaseAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        shapeLayerBaseAnimation.removedOnCompletion = false
        shapeLayerBaseAnimation.fillMode = kCAFillModeForwards
        return shapeLayerBaseAnimation
    }
    
    /**
     addBesizerPath for customshapeLayer
     - returns: besizerPath
     */
    private func shapeLayerPath(position position : CGFloat, progress : CGFloat) -> UIBezierPath{
        let besizierPath = UIBezierPath()
        besizierPath.moveToPoint(CGPointMake(0, position))
        besizierPath.addLineToPoint(CGPointMake(frame.size.width * progress, position))
        return besizierPath
    }
}
