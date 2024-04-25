//
//  ProductDetailCoordinator.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 25/04/24.
//

import UIKit

final class ProductDetailCoordinator: Coordinator, ProductDetailControllerCoordinator {
    var navigation: UINavigationController
    private var factory: ProductDetailFactory
    private var productItemId: String
    private let logger: Logger
    
    init(navigation: UINavigationController, factory: ProductDetailFactory, productItemId: String, logger: Logger) {
        self.navigation = navigation
        self.factory = factory
        self.productItemId = productItemId
        self.logger = logger
    }
    
    func start() {
        let controller = factory.makeModule(coordinator: self, productItemId: productItemId, logger: logger)
        navigation.navigationBar.prefersLargeTitles = true
        navigation.pushViewController(controller, animated: true)
    }
}
