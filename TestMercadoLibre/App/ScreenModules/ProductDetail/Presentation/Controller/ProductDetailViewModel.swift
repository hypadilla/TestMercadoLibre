//
//  ProductDetailViewModel.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 25/04/24.
//

import Combine

protocol ProductDetailViewModel {
    var state: PassthroughSubject<StateController, Never> { get }
    var productDetail: ProductDetail { get }
    func loadProduct(productItemId: String)
}

final class ProductDetailViewModelImp: ProductDetailViewModel {
    var state: PassthroughSubject<StateController, Never>
    
    private let loadProductDetailUseCase: LoadProductDetailUseCase
    private let logger: Logger
    internal var productDetail: ProductDetail = ProductDetail(id: String(), title: String(), price: .zero,  condition: String(), pictures: [])
    
    init(state: PassthroughSubject<StateController, Never>, loadProductDetailUseCase: LoadProductDetailUseCase, logger: Logger) {
        self.loadProductDetailUseCase = loadProductDetailUseCase
        self.state = state
        self.logger = logger
    }
    
    var product : ProductDetail {
        return productDetail
    }
    
    func loadProduct(productItemId: String) {
        state.send(.loading)
        Task {
            do {
                let result = try await loadProductDetailUseCase.execute(productItemId: productItemId)
                switch result {
                case .success(let item):
                    self.productDetail = item
                    state.send(.success)
                    logger.log(message: AppLocalized.productLoadedSuccessfully, type: .info)
                case .failure(let error):
                    state.send(.fail(error: error.localizedDescription))
                    logger.log(message: "\(AppLocalized.errorLoadingProduct) \(error.localizedDescription)", type: .error)
                }
            } catch {
                state.send(.fail(error: error.localizedDescription))
                logger.log(message: "\(AppLocalized.errorLoadingProduct) \(error.localizedDescription)", type: .error)
            }
        }
    }
}

