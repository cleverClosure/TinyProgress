//
//  ProgressBarView.swift
//  1Streak
//
//  Created by Tim on 16.04.2018.
//  Copyright © 2018 yujtah. All rights reserved.
//

import UIKit

@IBDesignable class TinyProgress: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 4
    @IBInspectable var innerBarPointDifference: CGFloat = 1 {
        didSet {
            let halfHeight = self.frame.height / 2
            if innerBarPointDifference >= halfHeight {
                innerBarPointDifference = halfHeight - 1
            }
        }
    }
    
    var innerColor: UIColor = UIColor.gray
    
    @IBInspectable var progress: CGFloat = 0.0 {
        didSet {
            if self.progress > 1.0 {
                self.progress = 1.0
            } else if self.progress < 0.0 {
                self.progress = 0.0
            }
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawBackground()
        drawInnerBar(progress: progress)
    }
    
    private func drawInnerBar(progress: CGFloat = 0) {
        let innerWidth = frame.width - innerBarPointDifference * 2
        let innerHeight = frame.height - innerBarPointDifference * 2
        let z = innerHeight / frame.height
        let innerPath = UIBezierPath(roundedRect: CGRect(x: innerBarPointDifference, y: innerBarPointDifference, width: innerWidth * progress, height: innerHeight), cornerRadius: cornerRadius * z)
        self.innerColor.setFill()
        innerPath.fill()
    }
    
    private func drawBackground() {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
    }
}
