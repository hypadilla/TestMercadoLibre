//
//  ProductListFactory.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 21/04/24.
//

import UIKit

/// A factory protocol for creating the product list module and coordinator.
protocol ProductListFactory {
    
    /// Creates the product list module.
    /// - Parameters:
    ///   - coordinator: The coordinator for the product list module.
    ///   - productList: The list of search items to display.
    ///   - logger: The logger instance for logging events.
    /// - Returns: The view controller for the product list module.
    func makeModule(coordinator: ProductListControllerCoordinator, productList: [SearchItem], logger: Logger) -> UIViewController
    
    /// Creates the coordinator for the product detail module.
    /// - Parameters:
    ///   - navigation: The navigation controller to push the product detail module onto.
    ///   - productId: The ID of the product to display.
    ///   - logger: The logger instance for logging events.
    /// - Returns: The coordinator for the product detail module.
    func makeCoordinatorProductDetail(navigation: UINavigationController, productId: String, logger: Logger) -> ProductDetailCoordinator
}

/// The implementation of the `ProductListFactory` protocol.
struct ProductListFactoryImp: ProductListFactory {
    
    func makeModule(coordinator: ProductListControllerCoordinator, productList: [SearchItem], logger: Logger) -> UIViewController {
        let controller = ProductListController(
            collectionViewLayout: makeLayout(),
            coordinator: coordinator,
            productList: productList,
            logger: logger
        )
        controller.title = AppLocalized.productList
        return controller
    }
    
    func makeCoordinatorProductDetail(navigation: UINavigationController, productId: String, logger: Logger) -> ProductDetailCoordinator {
        let factory = ProductDetailFactoryImp()
        return ProductDetailCoordinator(navigation: navigation, factory: factory, productItemId: productId, logger: logger)
    }
    
    private func makeLayout()-> UICollectionViewLayout{
        let layout = UICollectionViewFlowLayout()
        let layoutWidth = (ViewValues.widthScreen - 20) / 2
        let layoutHeight = (ViewValues.widthScreen) * 2 / 3
        layout.itemSize = CGSize(width: layoutWidth, height: layoutHeight)
        layout.minimumLineSpacing = .zero
        layout.minimumInteritemSpacing = .zero
        layout.sectionInset = UIEdgeInsets(top: .zero, left: 10, bottom: .zero, right: 10)
        return layout
    }
}
