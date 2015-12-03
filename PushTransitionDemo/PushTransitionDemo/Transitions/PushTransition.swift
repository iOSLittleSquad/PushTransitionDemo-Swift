//
//  PushTransition.swift
//  PushTransitionDemo
//
//  Created by CG on 15/12/3.
//  Copyright © 2015年 iOSLittleSquad. All rights reserved.
//

import UIKit

class PushTransition: UIPercentDrivenInteractiveTransition, UIViewControllerAnimatedTransitioning, UINavigationControllerDelegate {

    // MARK: properties
    
    var convertCellRect: CGRect = CGRectZero
    
    internal var naviOperation: UINavigationControllerOperation = .Push
    
    internal weak var topView: UIImageView?
    
    internal weak var bottomView: UIImageView?
    
    // MARK: UIViewControllerAnimatedTransitioning
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromVC: UIViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let toVC: UIViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let containerView: UIView = transitionContext.containerView()!
        
        if self.naviOperation == .Push {
            let imgTuple: (UIImage!, UIImage!) = AppDelegate.currentWindow().snapshotCutedIntoTwoPartsByPointY(CGRectGetMaxY(self.convertCellRect))
            if topView != nil {
                self.topView = nil
            }
            let topImg: UIImageView = UIImageView(frame: CGRectMake(0, 0, ScreenWidth, CGRectGetMaxY(self.convertCellRect)))
            topImg.image = imgTuple.0
            AppDelegate.currentWindow().addSubview(topImg)
            self.topView = topImg
            
            let bottomImg: UIImageView = UIImageView(frame: CGRectMake(0, CGRectGetMaxY(self.convertCellRect), ScreenWidth, ScreenHeight - CGRectGetMaxY(self.convertCellRect)))
            bottomImg.image = imgTuple.1
            AppDelegate.currentWindow().addSubview(bottomImg)
            self.bottomView = bottomImg
            
            toVC.view.frame = CGRectMake(0, CGRectGetMaxY(self.convertCellRect), ScreenWidth, toVC.view.frame.height)
            toVC.view.alpha = 0.5
            containerView.addSubview(toVC.view)
        }

        UIView.animateWithDuration(self.transitionDuration(transitionContext),
            delay: 0,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 0,
            options: UIViewAnimationOptions.CurveEaseInOut,
            animations: {
                var topRect: CGRect = self.topView!.frame
                var bottomRect: CGRect = self.bottomView!.frame
                
                if self.naviOperation == .Push {
                    var toViewRect: CGRect = toVC.view.frame
                    toViewRect.origin.y = 0
                    toVC.view.alpha = 1
                    toVC.view.frame = toViewRect

                    topRect.origin.y = -CGRectGetMaxY(topRect)
                    self.topView?.alpha = 0.5
                    
                    bottomRect.origin.y = ScreenHeight
                    self.bottomView?.alpha = 0.5
                }
                else if self.naviOperation == .Pop {
                    var toViewRect: CGRect = fromVC.view.frame
                    toViewRect.origin.y = CGRectGetMaxY(self.convertCellRect)
                    fromVC.view.alpha = 0.5
                    fromVC.view.frame = toViewRect

                    topRect.origin.y = 0
                    self.topView?.alpha = 1
                    
                    bottomRect.origin.y = CGRectGetMaxY(self.convertCellRect)
                    self.bottomView?.alpha = 1
                }
                
                self.topView?.frame = topRect
                self.bottomView?.frame = bottomRect
            }) {
                (isFinished: Bool) -> Void in
                if self.naviOperation == .Pop {
                    containerView.addSubview(toVC.view)
                    self.topView?.removeFromSuperview()
                    self.bottomView?.removeFromSuperview()
                    
                    self.topView = nil
                    self.bottomView = nil
                }
                
                transitionContext.completeTransition(true)
        }
        
        
    }
    
    // MARK: UINavigationControllerDelegate
    
    func navigationController(navigationController: UINavigationController,
        animationControllerForOperation operation: UINavigationControllerOperation,
        fromViewController fromVC: UIViewController,
        toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
            self.naviOperation = operation
            
        return self
    }
    
}
