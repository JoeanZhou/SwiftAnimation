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
    func shapeLayerValue(animationDuration1 : CFTimeInterval, count1 : [CGFloat]){
        count = count1
        animationDuration = animationDuration1
        
        var originalY : CGFloat = 10
        for i in 0 ..< Int(count1.count){
        
            addShapeLayer(position: originalY, progress : count![i])
            addLabel(position : originalY - 7, progress : count![i])
            originalY += 20
        }
    }
    
    /**
     add a progress lable to view
     */
    fileprivate func addLabel(position : CGFloat, progress : CGFloat){
        let lable = UILabel(frame: CGRect(x: 0, y: position, width: 0, height: 0))
        lable.text = "\(progress * 100)%"
        lable.font = UIFont.systemFont(ofSize: 12.0)
        lable.sizeToFit()
        lable.layer.add(addSharpLayerAnimation(keypath: "transform.translation.x", tovalue: frame.size.width * progress + 5), forKey: "translationAnimation")
        addSubview(lable)
        
    }
    
    /**
     to add a shapeLayer to layer and excute a animation for layer
     */
    fileprivate func addShapeLayer(position : CGFloat, progress : CGFloat){
        let shapeLayer : CAShapeLayer = CAShapeLayer()
        shapeLayer.lineWidth = 10
        shapeLayer.strokeColor = UIColor.blue.cgColor
        shapeLayer.path = shapeLayerPath(position: position, progress: progress).cgPath
        shapeLayer.add(addSharpLayerAnimation(keypath : "strokeEnd", tovalue : 1.0), forKey: "storkeEndAnimation")
        layer.addSublayer(shapeLayer)
    }
    
    /**
     add Animation for shapeLayer
     
     - returns: CABaseanimation
     */
    fileprivate func addSharpLayerAnimation(keypath : String, tovalue : CGFloat?) -> CABasicAnimation{
        
        let shapeLayerBaseAnimation = CABasicAnimation(keyPath: keypath)
        shapeLayerBaseAnimation.fromValue = 0.0
        shapeLayerBaseAnimation.toValue = tovalue
        shapeLayerBaseAnimation.duration = 1.25
        shapeLayerBaseAnimation.repeatCount = 10
        shapeLayerBaseAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        shapeLayerBaseAnimation.isRemovedOnCompletion = false
        shapeLayerBaseAnimation.fillMode = kCAFillModeForwards
        return shapeLayerBaseAnimation
    }
    
    /**
     addBesizerPath for customshapeLayer
     - returns: besizerPath
     */
    fileprivate func shapeLayerPath(position : CGFloat, progress : CGFloat) -> UIBezierPath{
        let besizierPath = UIBezierPath()
        besizierPath.move(to: CGPoint(x: 0, y: position))
        besizierPath.addLine(to: CGPoint(x: frame.size.width * progress, y: position))
        return besizierPath
    }
}
