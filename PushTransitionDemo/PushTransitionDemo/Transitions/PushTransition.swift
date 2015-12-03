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
        
        // TODO: to be continued...
        
    }
    
    // MARK: UINavigationControllerDelegate
    
    func navigationController(navigationController: UINavigationController,
        animationControllerForOperation operation: UINavigationControllerOperation,
        fromViewController fromVC: UIViewController,
        toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
}
