//
//  SearchFactory.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 19/04/24.
//

import UIKit
import Combine

protocol SearchFactory {
    func makeModule(coordinator: SearchViewControllerCoordinator, logger: Logger) -> UIViewController
    func makeCoordinatorProductList(navigation: UINavigationController, productList: [SearchItem], logger: Logger) -> Coordinator
}

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

