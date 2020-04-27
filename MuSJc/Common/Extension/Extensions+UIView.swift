//
//  Extensions+UIView.swift
//  MuSJc
//
//  Created by Tran Gia Huy on 4/25/20.
//  Copyright © 2020 Tran Gia Huy. All rights reserved.
//

import UIKit

extension UIView{
    func rotate() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
		rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 1
		rotation.isCumulative = true
		rotation.repeatCount = .infinity
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
}
