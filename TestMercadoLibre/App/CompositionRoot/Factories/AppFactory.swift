//
//  AppFactory.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 19/04/24.
//

import UIKit

/// A factory protocol for creating coordinators and other components related to the app.
protocol AppFactory {
    
    /// Creates a search coordinator.
    /// - Parameters:
    ///   - navigation: The navigation controller to be used by the coordinator.
    ///   - logger: The logger to be used by the coordinator.
    /// - Returns: A coordinator instance.
    func makeSearchCoordinator(navigation: UINavigationController, logger: Logger) -> Coordinator
}

/// An implementation of the `AppFactory` protocol.
struct AppFactoryImp: AppFactory {
    let logger: Logger
    
    init(logger: Logger) {
        self.logger = logger
    }
    
    func makeSearchCoordinator(navigation: UINavigationController, logger: Logger) -> Coordinator {
        let searchFactory = SearchFactoryImp()
        return SearchCoordinator(navigation: navigation, searchFactory: searchFactory, logger: logger)
    }
}
