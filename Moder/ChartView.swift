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
        self.backgroundColor = UIColor.white
        self.layer.shouldRasterize = true
        self.originalCenter = center
        animator = UIDynamicAnimator(referenceView: self)
        
        chartImageView = UIImageView()
        self.newImage = resizeImage(image: image, newSize: CGSize(width: self.frame.width, height: self.frame.height))
        //self.layer.contents = self.image.cgImage
        chartImageView.backgroundColor = UIColor.white
        chartImageView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height).integral
        chartImageView.image = newImage
        //chartImageView.contentMode = UIViewContentMode.scaleAspectFit
        self.addSubview(chartImageView)
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder: ) has not been implemented")
    }
    
    func swipe(_ starred: Bool){
        animator.removeAllBehaviors()
        let gravityX = starred ? 0.5: -0.5
        let magnitude = starred ? 20.0 : -20.0
        let gravityBehavior = UIGravityBehavior(items: [self])
        gravityBehavior.gravityDirection = CGVector(dx: CGFloat(gravityX), dy: 0)
        animator.addBehavior(gravityBehavior)
        
        let pushBehavior = UIPushBehavior(items: [self], mode: UIPushBehaviorMode.instantaneous)
        pushBehavior.magnitude = CGFloat(magnitude)
        animator.addBehavior(pushBehavior)
    }
    
    
    func returnToCenter(){
        UIView.animate(withDuration: 0.8, delay: 0.1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.2, options: .allowUserInteraction, animations: {
            self.center = self.originalCenter
            }, completion: { finished in
                print("Finished Animation")
        })
    }
    
    func resizeImage(image: UIImage, newSize: CGSize) -> (UIImage) {
        let newRect = CGRect(x: 0,y: 0, width: newSize.width, height: newSize.height).integral
        let imageRef = image.cgImage
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0)
        let context = UIGraphicsGetCurrentContext()
        
        // Set the quality level to use when rescaling
        context!.interpolationQuality = CGInterpolationQuality.high
        let flipVertical = CGAffineTransform(a: 1, b: 0, c: 0, d: -1, tx: 0, ty: newSize.height)
        
        context?.concatenate(flipVertical)
        // Draw into the context; this scales the image
        context?.draw(imageRef!, in: newRect)
        
        let newImageRef = (context?.makeImage()!)! as CGImage
        let newImage = UIImage(cgImage: newImageRef)
        
        // Get the resized image from the context and a UIImage
        UIGraphicsEndImageContext()
        
        return newImage
    }
}









