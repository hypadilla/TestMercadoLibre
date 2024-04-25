//
//  ItemProductViewCell.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 21/04/24.
//

import UIKit
import AlamofireImage

final class ProductListItemViewCell: UICollectionViewCell {
    
    private let mainContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGroupedBackground
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        return label
    }()
    
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
            bottom: priceLabel.topAnchor,
            left: mainContainer.leftAnchor,
            pBottom: 10
        )
    }
    
    
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
