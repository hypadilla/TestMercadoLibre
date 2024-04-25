//
//  ProductListCoordinator.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 21/04/24.
//

import UIKit

final class ProductListCoordinator: Coordinator {
    var navigation: UINavigationController
    private var factory: ProductListFactory
    private var productList: [SearchItem]
    private let logger: Logger
    
    init(navigation: UINavigationController, factory: ProductListFactory, productList: [SearchItem], logger: Logger) {
        self.navigation = navigation
        self.factory = factory
        self.productList = productList
        self.logger = logger
    }
    
    func start() {
        let controller = factory.makeModule(coordinator: self, productList: productList, logger: logger)
        navigation.navigationBar.prefersLargeTitles = true
        navigation.pushViewController(controller, animated: true)
    }
}

extension ProductListCoordinator: ProductListControllerCoordinator {
    func didSelectProductItem(productId: String) {
        goToProductDetail(productId: productId)
    }
    
    private func goToProductDetail(productId: String) {
        let productDetailCoordinator = factory.makeCoordinatorProductDetail(navigation: navigation, productId: productId, logger: logger)
        productDetailCoordinator.start()
    }
}
