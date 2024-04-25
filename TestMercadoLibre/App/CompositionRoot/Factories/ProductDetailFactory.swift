//
//  ProductDetailFactory.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 25/04/24.
//

import UIKit
import Combine

protocol ProductDetailFactory {
    func makeModule(coordinator: ProductDetailControllerCoordinator, productItemId: String, logger: Logger) -> UIViewController
}

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
