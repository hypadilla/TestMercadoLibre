//
//  SpinnerDisplayable.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 20/04/24.
//

import UIKit

/// A protocol that defines methods for displaying and hiding a spinner.
protocol SpinnerDisplayable {
    
    /// Displays the spinner.
    func showSpinner()
    
    /// Hides the spinner.
    func hideSpinner()
}

extension SpinnerDisplayable where Self : UIViewController {
    
    /// Displays the spinner.
    func showSpinner() {
        guard doesNotExistAnotherSpinner else { return }
        configureSpinner()
    }
    
    /// Configures the spinner view and adds it to the parent view.
    private func configureSpinner() {
        let containerView = UIView()
        containerView.tag = ViewValues.tagIdentifierSpinner
        parentView.addSubview(containerView)
        containerView.fillSuperview()
        containerView.backgroundColor = UIColor.black.withAlphaComponent(ViewValues.opacityContainerSpinner)
        addSpinnerIndicatorToContainer(containerView: containerView)
    }
    
    /// Adds the spinner indicator to the container view.
    private func addSpinnerIndicatorToContainer(containerView: UIView) {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.startAnimating()
        containerView.addSubview(spinner)
        spinner.centerXY()
    }
    
    /// Hides the spinner.
    func hideSpinner() {
        if let foundView = parentView.viewWithTag(ViewValues.tagIdentifierSpinner) {
            foundView.removeFromSuperview()
        }
    }
    
    /// Checks if another spinner view already exists in the parent view.
    private var doesNotExistAnotherSpinner: Bool {
        parentView.viewWithTag(ViewValues.tagIdentifierSpinner) == nil
    }
    
    /// Returns the parent view, which is either the navigation controller's view or the current view.
    private var parentView: UIView {
        navigationController?.view ?? view
    }
}
