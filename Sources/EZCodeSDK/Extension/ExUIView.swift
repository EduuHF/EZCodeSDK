//
//  ExUIView.swift
//  BAApp
//
//  Created by Edu on 19/05/22.
//

import Foundation
import UIKit
import ViewAnimator

extension UIView {

    // MARK: - Properties
    @IBInspectable var cornerRadius: Double {
        get {
            return Double(self.layer.cornerRadius)
        }
        set {
            self.layer.cornerRadius = CGFloat(newValue)
        }
    }

    @IBInspectable var borderWidth: Double {
        get {
            return Double(self.layer.borderWidth)
        }
        set {
            self.layer.borderWidth = CGFloat(newValue)
        }
    }

    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }

    func animFromLeft() {
         self.animate(animations: [AnimationType.animFromLeft],
                      duration: 1.0)
    }

    func animFromRight() {
         self.animate(animations: [AnimationType.animFromRight],
                      duration: 1.0)
    }

    func animFromTop() {
         self.animate(animations: [AnimationType.animFromTop],
                      duration: 1.0)
    }

    func animFromBottom() {
         self.animate(animations: [AnimationType.animFromBottom],
                      duration: 1.0)
    }

    func animShake(count: Float = 4,
                   range: CGFloat = 6,
                   duration: Double = 0.07) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = duration
        animation.repeatCount = count
        animation.autoreverses = true
        animation.fromValue = CGPoint(x: self.center.x - range,
                                      y: self.center.y)
        animation.toValue = CGPoint(x: self.center.x + range,
                                    y: self.center.y)
        self.layer.add(animation,
                       forKey: "position")
    }

    func animFadeOut(duration: Double = 0.3) {
        UIView.animate(withDuration: duration,
                       animations: {
            self.alpha = 0
        })
    }

    func animFadeIn(duration: Double = 0.3) {
        UIView.animate(withDuration: duration,
                       animations: {
            self.alpha = 1
        })
    }

    func findViewWithTag(tag: Int) -> UIView? {

        for sView in self.subviews where
        sView.tag == tag {
            do {
                return sView
            }
        }

        return nil
    }

    func addShadowToView(color: UIColor = .black,
                         radius: CGFloat = 5,
                         rect: CGRect = .zero) {

        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: rect,
                                             byRoundingCorners: .bottomRight,
                                             cornerRadii: CGSize(width: 8, height: 8)).cgPath
    }

    func addVBorder(cornerList: UIRectCorner,
                    radius: CGFloat,
                    roundedRect: CGRect? = nil) {
        let mPath = UIBezierPath(roundedRect: roundedRect ?? bounds,
                                 byRoundingCorners: cornerList,
                                 cornerRadii: CGSize(width: radius,
                                                     height: radius))
        let mMask = CAShapeLayer()
        mMask.path = mPath.cgPath
        layer.mask = mMask
        self.setNeedsLayout()
    }
}

extension AnimationType {

    static var animFromLeft: AnimationType {
        return AnimationType.from(direction: .left,
                                  offset: 30.0)
    }

    static var animFromRight: AnimationType {
        return AnimationType.from(direction: .right,
                                  offset: 30.0)
    }

    static var animFromTop: AnimationType {
        return AnimationType.from(direction: .top,
                                  offset: 30.0)
    }

    static var animFromBottom: AnimationType {
        return AnimationType.from(direction: .bottom,
                                  offset: 30.0)
    }
}
