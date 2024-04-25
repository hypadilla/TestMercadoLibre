//
//  ProductDetailController.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 25/04/24.
//

import UIKit
import Combine
import AlamofireImage

protocol ProductDetailControllerCoordinator : AnyObject{

}

final class ProductDetailController: UIViewController {
    
    private let viewModel: ProductDetailViewModel
    private var cancellable = Set<AnyCancellable>()
    private let productItemId: String
    private weak var coordinator: ProductDetailControllerCoordinator?
    
    init(viewModel: ProductDetailViewModel, coordinator: ProductDetailControllerCoordinator, productItemId: String) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        self.productItemId = productItemId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        stateController()
        viewModel.loadProduct(productItemId: productItemId)
        navigationController?.navigationBar.barTintColor = UIColor.mainColor
        navigationController?.navigationBar.tintColor = UIColor.black
    }
    
    private func stateController(){
        viewModel.state.receive(on: RunLoop.main).sink { [weak self] state in
            self?.hideSpinner()
            switch state {
            case .success:
                self?.configureProductDetail()
            case .loading:
                self?.showSpinner()
            case .fail(error: let error):
                self?.presentAlert(message: error, title: AppLocalized.error)
            }
        }.store(in: &cancellable)
    }
    
    //Crea el UIImageView, y las demas vistas
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    private let conditionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    override func loadView() {
        configUI()
    }
    
    private func configUI(){
        self.view = UIView()
        self.view.backgroundColor = .systemBackground
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(priceLabel)
        view.addSubview(conditionLabel)
        view.addSubview(descriptionLabel)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        conditionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            priceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            conditionLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 10),
            conditionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            conditionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            descriptionLabel.topAnchor.constraint(equalTo: conditionLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        ])
    }
    
    private func configureProductDetail() {
        let productDetail = viewModel.productDetail
        titleLabel.text = productDetail.title
        if let formattedPrice = productDetail.price.formattedAsCurrency() {
            priceLabel.text = formattedPrice
        } else {
            priceLabel.text = "$\(productDetail.price)"
        }
        conditionLabel.text = productDetail.condition
        if let url = URL(string: productDetail.pictures[0].secure_url) {
            imageView.af.setImage(withURL: url)
        }
    }
}

extension ProductDetailController: SpinnerDisplayable {}

extension ProductDetailController: MessageDisplayable {}
