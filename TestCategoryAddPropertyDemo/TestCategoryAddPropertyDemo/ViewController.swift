//
//  ViewController.swift
//  TestCategoryAddPropertyDemo
//
//  Created by AA on 16/1/11.
//  Copyright © 2016年 Caoly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let imageView0 :UIImageView =  UIImageView.init(frame: CGRectMake(50, 50, 100, 70))
        imageView0.backgroundColor = UIColor.blueColor()
        print("here :\(imageView0)")
        imageView0.imageName = "monkey.jpg"
        imageView0.borderWidth = 1
        imageView0.layerColor = UIColor.whiteColor()
        imageView0.cornerRadious = 4
        imageView0.addOthers()
        self.view.addSubview(imageView0)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

