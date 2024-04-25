//
//  SearchCoordinator.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 19/04/24.
//

import UIKit

final class SearchCoordinator: Coordinator {
    var navigation: UINavigationController
    private let searchFactory: SearchFactory
    private let logger: Logger
    
    init(navigation: UINavigationController, searchFactory: SearchFactory, logger: Logger) {
        self.navigation = navigation
        self.searchFactory = searchFactory
        self.logger = logger
    }
    
    func start() {
        let viewController = searchFactory.makeModule(coordinator: self, logger: logger)
        navigation.pushViewController(viewController, animated: true)
    }
}

extension SearchCoordinator: SearchViewControllerCoordinator {
    func didSearchList(model: [SearchItem]) {
        goToProductList(model: model)
    }
    
    private func goToProductList(model: [SearchItem]) {
        let productListCoordinator = searchFactory.makeCoordinatorProductList(navigation: navigation, productList: model, logger: logger)
        productListCoordinator.start()
    }
}
