//
//  UIImageExtension.swift
//  Moder
//
//  Created by Leqi Long on 11/3/16.
//  Copyright © 2016 TeamAwesome. All rights reserved.
//

import Foundation
import UIKit

//Source: http://stackoverflow.com/questions/29046571/cut-a-uiimage-into-a-circle-swiftios

extension UIImage{
    var rounded: UIImage? {
        let imageView = UIImageView(image: self)
        imageView.layer.cornerRadius = min(size.height/2, size.width/2)
        imageView.layer.masksToBounds = true
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, scale)
        guard let context = UIGraphicsGetCurrentContext() else {return nil}
        imageView.layer.render(in: context)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result
    }
}
