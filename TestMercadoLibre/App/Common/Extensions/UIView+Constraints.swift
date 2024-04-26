//
//  UIView+Constraints.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 20/04/24.
//

import UIKit

extension UIView {
    
    /// Fills the superview with constraints.
    func fillSuperview() {
        guard let superview = self.superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superview.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superview.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
    }
    
    /// Fills the superview with constraints and adds padding.
    ///
    /// - Parameter widthPadding: The padding to be applied to all sides of the superview.
    func fillSuperView(widthPadding: CGFloat = .zero) {
        guard let superview = self.superview else { return }
        setConstraints(
            top: superview.topAnchor,
            right: superview.rightAnchor,
            bottom: superview.bottomAnchor,
            left: superview.leftAnchor,
            pTop: widthPadding,
            pRight: widthPadding,
            pBottom: widthPadding,
            pLeft: widthPadding)
    }
    
    /// Sets constraints for the view.
    ///
    /// - Parameters:
    ///   - top: The top anchor of the view.
    ///   - right: The right anchor of the view.
    ///   - bottom: The bottom anchor of the view.
    ///   - left: The left anchor of the view.
    ///   - pTop: The padding from the top anchor.
    ///   - pRight: The padding from the right anchor.
    ///   - pBottom: The padding from the bottom anchor.
    ///   - pLeft: The padding from the left anchor.
    func setConstraints(
        top: NSLayoutYAxisAnchor? = nil,
        right: NSLayoutXAxisAnchor? = nil,
        bottom: NSLayoutYAxisAnchor? = nil,
        left: NSLayoutXAxisAnchor? = nil,
        pTop: CGFloat = 0,
        pRight: CGFloat = 0,
        pBottom: CGFloat = 0,
        pLeft: CGFloat = 0
    ) {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: pTop).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -pRight).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -pBottom).isActive = true
        }
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: pLeft).isActive = true
        }
    }
    
    /// Centers the view vertically within its superview.
    func centerY(){
        guard let superview = self.superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
    }
    
    /// Centers the view horizontally within its superview.
    func centerX(){
        guard let superview = self.superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
    }
    
    /// Centers the view both vertically and horizontally within its superview.
    func centerXY(){
        centerX()
        centerY()
    }
    
    /// Sets the aspect ratio of the view.
    ///
    /// - Parameter ratio: The ratio to be applied to the width and height of the view.
    func aspectRatio(_ ratio: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalTo: heightAnchor, multiplier: ratio).isActive = true
    }
    
    /// Sets the width of the view.
    ///
    /// - Parameter width: The width to be applied to the view.
    func setWidth(_ width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    /// Sets the height of the view.
    ///
    /// - Parameter height: The height to be applied to the view.
    func setHeight(_ height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
}
