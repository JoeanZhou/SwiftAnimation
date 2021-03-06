//
//  ViewController.swift
//  SwiftAnimation
//
//  Created by dajie on 15/12/24.
//  Copyright © 2015年 dajie. All rights reserved.
//

import UIKit

class BarAnimationGarphic: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let customView = CustomView()
        customView.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
        view.addSubview(customView)
        customView.shapeLayerValue(animationDuration1: 1.25, count1 : [0.5, 0.21, 0.74, 0.87, 0.23, 0.34, 0.45])
    }
}

