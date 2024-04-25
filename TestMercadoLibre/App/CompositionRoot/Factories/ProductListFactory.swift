//
//  ProductListFactory.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 21/04/24.
//

import UIKit

protocol ProductListFactory {
    func makeModule(coordinator: ProductListControllerCoordinator, productList: [SearchItem], logger: Logger) -> UIViewController
    func makeCoordinatorProductDetail(navigation: UINavigationController, productId: String, logger: Logger) -> ProductDetailCoordinator
}

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
        let layoutHeight = (ViewValues.widthScreen) / 2
        layout.itemSize = CGSize(width: layoutWidth, height: layoutHeight)
        layout.minimumLineSpacing = .zero
        layout.minimumInteritemSpacing = .zero
        layout.sectionInset = UIEdgeInsets(top: .zero, left: 10, bottom: .zero, right: 10)
        return layout
    }
}
