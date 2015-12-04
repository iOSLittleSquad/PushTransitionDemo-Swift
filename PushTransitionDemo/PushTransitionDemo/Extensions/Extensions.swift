//
//  Extensions.swift
//  PushTransitionDemo
//
//  Created by CG on 15/12/3.
//  Copyright © 2015年 iOSLittleSquad. All rights reserved.
//

import UIKit

// MARK: - extension for UIView snapshot.

let ScreenWidth: CGFloat = UIScreen.mainScreen().bounds.width
let ScreenHeight: CGFloat = UIScreen.mainScreen().bounds.height

extension UIView {

    func snapshot() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, 0.0)
        let ctx: CGContextRef = UIGraphicsGetCurrentContext()!
        self.layer.renderInContext(ctx)
        let snapshotImg: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return snapshotImg
    }
    
    /*!
    cut the snapshot image into top and bottom image.
    
    - parameter y: the separated line at y point.
    
    - returns: (first-topImg, second-bottomImg).
    */
    func snapshotCutedIntoTwoPartsByPointY(y: CGFloat!) -> ( UIImage!, UIImage!) {
        var originY: CGFloat = y
        if originY > ScreenHeight {
            originY = ScreenHeight - 1
        }
        let snapshotImg: UIImage = self.snapshot()!
        let originUpRect = CGRectMake(0, 0, ScreenWidth, originY)
        let originDownRect = CGRectMake(0, y, ScreenWidth, ScreenHeight - originY)
        
        //transform rect with the scale of snapshot image.
        let transform: CGAffineTransform = CGAffineTransformScale(CGAffineTransformIdentity, snapshotImg.scale, snapshotImg.scale)
        let upRect: CGRect = CGRectApplyAffineTransform(originUpRect, transform)
        let downRect: CGRect = CGRectApplyAffineTransform(originDownRect, transform)
        
        //generate image by rect
        let upImg: UIImage = UIImage(CGImage: CGImageCreateWithImageInRect(snapshotImg.CGImage, upRect)!)
        let downImg: UIImage = UIImage(CGImage: CGImageCreateWithImageInRect(snapshotImg.CGImage, downRect)!)
        return (upImg, downImg)
    }
    
}