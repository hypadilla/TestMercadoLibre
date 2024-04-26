//
//  ProductDetailCoordinator.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 25/04/24.
//

import UIKit

/// The coordinator responsible for handling the product detail screen.
final class ProductDetailCoordinator: Coordinator, ProductDetailControllerCoordinator {
    var navigation: UINavigationController
    private var factory: ProductDetailFactory
    private var productItemId: String
    private let logger: Logger
    
    /// Initializes the product detail coordinator.
    /// - Parameters:
    ///   - navigation: The navigation controller to be used for navigation.
    ///   - factory: The factory responsible for creating the product detail module.
    ///   - productItemId: The ID of the product to be displayed.
    ///   - logger: The logger to be used for logging.
    init(navigation: UINavigationController, factory: ProductDetailFactory, productItemId: String, logger: Logger) {
        self.navigation = navigation
        self.factory = factory
        self.productItemId = productItemId
        self.logger = logger
    }
    
    /// Starts the product detail coordinator.
    func start() {
        let controller = factory.makeModule(coordinator: self, productItemId: productItemId, logger: logger)
        navigation.navigationBar.prefersLargeTitles = true
        navigation.pushViewController(controller, animated: true)
    }
}
