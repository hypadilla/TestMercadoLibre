//
//  ProductListCoordinator.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 21/04/24.
//

import UIKit

/// The coordinator responsible for managing the product list screen.
final class ProductListCoordinator: Coordinator {
    var navigation: UINavigationController
    private var factory: ProductListFactory
    private var productList: [SearchItem]
    private let logger: Logger
    
    /// Initializes the product list coordinator.
    /// - Parameters:
    ///   - navigation: The navigation controller to be used for navigation.
    ///   - factory: The factory responsible for creating the product list module.
    ///   - productList: The list of search items to be displayed.
    ///   - logger: The logger instance for logging events.
    init(navigation: UINavigationController, factory: ProductListFactory, productList: [SearchItem], logger: Logger) {
        self.navigation = navigation
        self.factory = factory
        self.productList = productList
        self.logger = logger
    }
    
    /// Starts the product list coordinator.
    func start() {
        let controller = factory.makeModule(coordinator: self, productList: productList, logger: logger)
        navigation.navigationBar.prefersLargeTitles = true
        navigation.pushViewController(controller, animated: true)
    }
}

extension ProductListCoordinator: ProductListControllerCoordinator {
    /// Handles the selection of a product item in the product list.
    /// - Parameter productId: The ID of the selected product.
    func didSelectProductItem(productId: String) {
        goToProductDetail(productId: productId)
    }
    
    private func goToProductDetail(productId: String) {
        let productDetailCoordinator = factory.makeCoordinatorProductDetail(navigation: navigation, productId: productId, logger: logger)
        productDetailCoordinator.start()
    }
}
