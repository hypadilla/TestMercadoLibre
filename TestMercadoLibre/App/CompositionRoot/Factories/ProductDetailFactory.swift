//
//  ProductDetailFactory.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 25/04/24.
//

import UIKit
import Combine

/// A factory protocol for creating the product detail module.
protocol ProductDetailFactory {
    
    /// Creates and returns the product detail module.
    /// - Parameters:
    ///   - coordinator: The coordinator for the product detail module.
    ///   - productItemId: The ID of the product item.
    ///   - logger: The logger instance for logging.
    /// - Returns: The view controller representing the product detail module.
    func makeModule(coordinator: ProductDetailControllerCoordinator, productItemId: String, logger: Logger) -> UIViewController
}

/// The implementation of the `ProductDetailFactory` protocol.
struct ProductDetailFactoryImp: ProductDetailFactory {
    
    func makeModule(coordinator: ProductDetailControllerCoordinator, productItemId: String, logger: Logger) -> UIViewController {
        let apiClientService = ApiClientServiceImp(logger: logger)
        let productDetailRepository = ProductDetailRepositoryImp(apiClientService: apiClientService, endpoint: Endpoint.itemUrl)
        let state = PassthroughSubject<StateController, Never>()
        
        let loadProductDetailUseCase = LoadProductDetailUseCaseImp(repository: productDetailRepository)
        
        let productDetailViewModel = ProductDetailViewModelImp(state: state, loadProductDetailUseCase: loadProductDetailUseCase, logger: logger)
        
        let productDetailController = ProductDetailController(viewModel: productDetailViewModel, coordinator: coordinator, productItemId: productItemId)
        
        return productDetailController
    }
}
