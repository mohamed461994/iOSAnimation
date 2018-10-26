//
//  PpupAnimator.swift
//  TestRefresherProtocol
//
//  Created by Muhamed Shaban on 10/25/18.
//  Copyright © 2018 Muhamed Shaban. All rights reserved.
//

import UIKit

class PpupAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    let duration = 1.0
    var originFrame = CGRect.zero
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        //1) Set up transition
        let containerView = transitionContext.containerView
        let toView = transitionContext.view(forKey: .to)!
        
        let initialFrame = originFrame
        let finalFrame = toView.frame
        
        toView.transform = CGAffineTransform(
            scaleX: initialFrame.width / finalFrame.width,
            y: initialFrame.height / finalFrame.height
        )
        toView.center = CGPoint(x: initialFrame.midX, y: initialFrame.midY)
        
        containerView.addSubview(toView)
        
        //2) Animate!
        UIView.animate(
            withDuration: duration,
            delay: 0.0,
            usingSpringWithDamping: 0.4,
            initialSpringVelocity: 0.0,
            animations: {
                toView.transform = .identity
                toView.center = CGPoint(x: finalFrame.midX, y: finalFrame.midY)
        },
            completion: { _ in
                //3) Complete transition
                transitionContext.completeTransition(true)
        }
        )
        
    }
}
