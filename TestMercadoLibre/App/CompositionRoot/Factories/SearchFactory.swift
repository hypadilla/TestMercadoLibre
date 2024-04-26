//
//  SearchFactory.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 19/04/24.
//

import UIKit
import Combine

/// A factory protocol for creating search-related modules and coordinators.
protocol SearchFactory {
    
    /// Creates a search module with the specified coordinator and logger.
    /// - Parameters:
    ///   - coordinator: The coordinator for the search module.
    ///   - logger: The logger for logging events.
    /// - Returns: A UIViewController representing the search module.
    func makeModule(coordinator: SearchViewControllerCoordinator, logger: Logger) -> UIViewController
    
    /// Creates a coordinator for the product list with the specified navigation controller, product list, and logger.
    /// - Parameters:
    ///   - navigation: The navigation controller for the product list.
    ///   - productList: The list of search items for the product list.
    ///   - logger: The logger for logging events.
    /// - Returns: A Coordinator representing the product list coordinator.
    func makeCoordinatorProductList(navigation: UINavigationController, productList: [SearchItem], logger: Logger) -> Coordinator
}

/// An implementation of the SearchFactory protocol.
struct SearchFactoryImp: SearchFactory {
    
    func makeModule(coordinator: SearchViewControllerCoordinator, logger: Logger) -> UIViewController {
        let apiClientService = ApiClientServiceImp(logger: logger)
        let searchRepository = SearchRepositoryImp(apiClientService: apiClientService, endpoint: Endpoint.searchUrl)
        let state = PassthroughSubject<StateController, Never>()
        let loadSearchUseCase = LoadSearchUseCaseImp(repository: searchRepository)
        
        let searchViewModel = SearchViewModelImp(state: state, loadSearchUseCase: loadSearchUseCase, logger: logger)
        
        let searchController = SearchController(viewModel: searchViewModel, coordinator: coordinator, logger: logger)
        searchController.title = AppLocalized.appName
        return searchController
    }
    
    func makeCoordinatorProductList(navigation: UINavigationController, productList: [SearchItem], logger: Logger) -> Coordinator {
        let productListFactory = ProductListFactoryImp()
        return ProductListCoordinator(navigation: navigation, factory: productListFactory, productList: productList, logger: logger)
    }
}

