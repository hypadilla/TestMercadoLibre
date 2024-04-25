//
//  ProductListController.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 21/04/24.
//

import UIKit

protocol ProductListControllerCoordinator {
    func didSelectProductItem(productId: String)
}

final class ProductListController: UICollectionViewController {
    
    private let coordinator: ProductListControllerCoordinator
    private var productList: [SearchItem] = []
    private let logger: Logger
    
    init(collectionViewLayout: UICollectionViewLayout, coordinator: ProductListControllerCoordinator, productList: [SearchItem], logger: Logger) {
        self.coordinator = coordinator
        self.productList = productList
        self.logger = logger
        super.init(collectionViewLayout: collectionViewLayout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configCollectionView()
    }
    
    private func configUI() {
        view.backgroundColor = .systemBackground
    }
    
    private func configCollectionView() {
        collectionView.register(ProductListItemViewCell.self, forCellWithReuseIdentifier: ProductListItemViewCell.reuseIdentifier)
    }
}

extension ProductListController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ProductListItemViewCell.reuseIdentifier,
            for: indexPath
        ) as? ProductListItemViewCell
        else {
            logger.log(message: "\(AppLocalized.failedToDequeueCell) \(indexPath)", type: .error)
            return UICollectionViewCell()
        }
        
        let product = productList[indexPath.item]
        cell.configure(with: product)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = productList[indexPath.item]
        coordinator.didSelectProductItem(productId: product.id)
    }
}
