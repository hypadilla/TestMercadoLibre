//
//  MessageDisplayable.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 20/04/24.
//

import UIKit

/// A protocol that defines a message displayable behavior for view controllers.
protocol MessageDisplayable {

}

extension MessageDisplayable where Self: UIViewController {
    /// Presents an alert with the given message and title.
    ///
    /// - Parameters:
    ///   - message: The message to be displayed in the alert.
    ///   - title: The title of the alert.
    func presentAlert(message: String, title: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: AppLocalized.okButton, style: .default)
        alertController.addAction(action)
        self.present(alertController, animated: true)
    }
}
