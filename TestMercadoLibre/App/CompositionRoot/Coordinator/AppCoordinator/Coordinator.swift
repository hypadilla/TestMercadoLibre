//
//  Coordinator.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 19/04/24.
//

import UIKit

/// The Coordinator protocol defines the common interface for all coordinators in the app.
protocol Coordinator {
    /// The navigation controller used for navigating between view controllers.
    var navigation: UINavigationController { get }
    
    /// Starts the coordinator and performs any necessary setup.
    func start()
}
