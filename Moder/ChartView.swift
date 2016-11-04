//
//  ChartView.swift
//  Moder
//
//  Created by Leqi Long on 11/3/16.
//  Copyright © 2016 TeamAwesome. All rights reserved.
//

import UIKit

class ChartView: UIView {

    let imageMarginSpace: CGFloat = 0
    //font
    var chartImageView: UIImageView!
    var animator: UIDynamicAnimator!
    var originalCenter: CGPoint!
    var image: UIImage!
    var starred: Bool!
    var newImage: UIImage!
    
    init(frame: CGRect, image: UIImage, center: CGPoint){
        super.init(frame: frame)
        self.center = center
        self.image = image
        self.backgroundColor = UIColor.whiteColor()
        self.layer.shouldRasterize = true
        self.originalCenter = center
        animator = UIDynamicAnimator(referenceView: self)
        
        chartImageView = UIImageView()
        self.newImage = resizeImage(image, newSize: CGSizeMake(self.frame.width, self.frame.height))
        chartImageView.image = newImage
        //self.layer.contents = self.newImage.CGImage
        chartImageView.backgroundColor = UIColor.whiteColor()
        chartImageView.frame = CGRectIntegral(CGRectMake(0.0 + self.imageMarginSpace, 0.0 + self.imageMarginSpace, self.frame.width - (2*self.imageMarginSpace), self.frame.height - (2*self.imageMarginSpace)))
        
        self.addSubview(chartImageView)
        
        //self.layer.contents = image.CGImage

    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder: ) has not been implemented")
    }
    
    func swipe(starred: Bool){
        animator.removeAllBehaviors()
        let gravityX = starred ? 0.5: -0.5
        let magnitude = starred ? 20.0 : -20.0
        let gravityBehavior = UIGravityBehavior(items: [self])
        gravityBehavior.gravityDirection = CGVectorMake(CGFloat(gravityX), 0)
        animator.addBehavior(gravityBehavior)
        
        let pushBehavior = UIPushBehavior(items: [self], mode: UIPushBehaviorMode.Instantaneous)
        pushBehavior.magnitude = CGFloat(magnitude)
        animator.addBehavior(pushBehavior)
    }
    
    
    func returnToCenter(){
        UIView.animateWithDuration(0.8, delay: 0.1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.2, options: .AllowUserInteraction, animations: {
            self.center = self.originalCenter
            }, completion: { finished in
                print("Finished Animation")
        })
    }
    
    func resizeImage(image: UIImage, newSize: CGSize) -> (UIImage) {
        let newRect = CGRectIntegral(CGRectMake(0,0, newSize.width, newSize.height))
        let imageRef = image.CGImage
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0)
        let context = UIGraphicsGetCurrentContext()
        
        // Set the quality level to use when rescaling
        CGContextSetInterpolationQuality(context, CGInterpolationQuality.High)
        let flipVertical = CGAffineTransformMake(1, 0, 0, -1, 0, newSize.height)
        
        CGContextConcatCTM(context, flipVertical)
        // Draw into the context; this scales the image
        CGContextDrawImage(context, newRect, imageRef)
        
        let newImageRef = CGBitmapContextCreateImage(context)! as CGImage
        let newImage = UIImage(CGImage: newImageRef)
        
        // Get the resized image from the context and a UIImage
        UIGraphicsEndImageContext()
        
        return newImage
    }
}









