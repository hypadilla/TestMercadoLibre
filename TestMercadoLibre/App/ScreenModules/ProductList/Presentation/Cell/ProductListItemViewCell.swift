//
//  ItemProductViewCell.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 21/04/24.
//

import UIKit
import AlamofireImage

/// A custom UICollectionViewCell used to display a product item in a list.
final class ProductListItemViewCell: UICollectionViewCell {
    
    /// The main container view that holds all the subviews.
    private let mainContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGroupedBackground
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    /// The image view that displays the product image.
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    /// The label that displays the product title.
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.numberOfLines = 2
        return label
    }()
    
    /// The label that displays the product price.
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configUI() {
        addSubview(mainContainer)
        mainContainer.fillSuperView(widthPadding: 10)
        
        mainContainer.addSubview(titleLabel)
        titleLabel.setConstraints(
            right: mainContainer.rightAnchor,
            bottom: mainContainer.bottomAnchor,
            left: mainContainer.leftAnchor,
            pRight: 10,
            pBottom: 10,
            pLeft: 10
        )
        
        mainContainer.addSubview(priceLabel)
        priceLabel.setConstraints(
            bottom: titleLabel.topAnchor,
            left: mainContainer.leftAnchor,
            pRight: 10,
            pLeft: 10
        )
        
        mainContainer.addSubview(productImageView)
        productImageView.setConstraints(
            top: mainContainer.topAnchor,
            right: mainContainer.rightAnchor,
            left: mainContainer.leftAnchor,
            pBottom: 10
        )
        productImageView.setHeight((ViewValues.widthScreen - 60) / 2)
    }
    
    /// Configures the cell with the given view model.
    /// - Parameter viewModel: The view model containing the data to be displayed.
    func configure(with viewModel: SearchItem) {
        titleLabel.text = viewModel.title
        if let formattedPrice = viewModel.price.formattedAsCurrency() {
            priceLabel.text = formattedPrice
        } else {
            priceLabel.text = "$\(viewModel.price)"
        }
        if let url = URL(string: viewModel.thumbnail) {
            productImageView.af.setImage(withURL: url)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        productImageView.image = nil
    }
}

extension ProductListItemViewCell: Reusable {}
