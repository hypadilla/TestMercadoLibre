//
//  UIView+Constraints.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 20/04/24.
//

import UIKit

extension UIView {
    func fillSuperview() {
        guard let superview = self.superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superview.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superview.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
    }
    
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
    
    func centerY(){
        guard let superview = self.superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
    }
    
    func centerX(){
        guard let superview = self.superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
    }
    
    func centerXY(){
        centerX()
        centerY()
    }
}
