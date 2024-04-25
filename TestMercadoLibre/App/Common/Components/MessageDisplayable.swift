//
//  MessageDisplayable.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 20/04/24.
//

import UIKit

protocol MessageDisplayable {

}

extension MessageDisplayable where Self: UIViewController {
    func presentAlert(message: String, title: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: AppLocalized.okButton, style: .default)
        alertController.addAction(action)
        self.present(alertController, animated: true)
    }
}
