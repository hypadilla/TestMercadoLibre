//
//  SearchCoordinator.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 19/04/24.
//

import UIKit

/// The coordinator responsible for handling the search functionality in the app.
final class SearchCoordinator: Coordinator {
    var navigation: UINavigationController
    private let searchFactory: SearchFactory
    private let logger: Logger
    
    /// Initializes a new instance of the `SearchCoordinator` class.
    /// - Parameters:
    ///   - navigation: The navigation controller to be used for navigation.
    ///   - searchFactory: The factory responsible for creating search-related modules.
    ///   - logger: The logger to be used for logging.
    init(navigation: UINavigationController, searchFactory: SearchFactory, logger: Logger) {
        self.navigation = navigation
        self.searchFactory = searchFactory
        self.logger = logger
    }
    
    /// Starts the search coordinator.
    func start() {
        let viewController = searchFactory.makeModule(coordinator: self, logger: logger)
        navigation.pushViewController(viewController, animated: true)
    }
}

extension SearchCoordinator: SearchViewControllerCoordinator {
    /// Handles the event when a search list is received.
    /// - Parameter model: The search items received from the search view controller.
    func didSearchList(model: [SearchItem]) {
        goToProductList(model: model)
    }
    
    private func goToProductList(model: [SearchItem]) {
        let productListCoordinator = searchFactory.makeCoordinatorProductList(navigation: navigation, productList: model, logger: logger)
        productListCoordinator.start()
    }
}
