//
//  SearchController.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 19/04/24.
//

import UIKit
import Combine

protocol SearchViewControllerCoordinator: AnyObject{
    func didSearchList(model: [SearchItem])
}

final class SearchController: UIViewController {
    
    private let viewModel: SearchViewModel
    private var cancellable = Set<AnyCancellable>()
    private weak var coordinator: SearchViewControllerCoordinator?
    private let logger: Logger
    
    init(viewModel: SearchViewModel, coordinator: SearchViewControllerCoordinator, logger: Logger) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        self.logger = logger
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let searchBar = UISearchBar()
    
    override func viewDidLoad() {
        stateController()
        navigationController?.navigationBar.barTintColor = UIColor.mainColor
        navigationController?.navigationBar.tintColor = UIColor.black
        
        let backBarButtton = UIBarButtonItem(title: String(), style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtton
    }
    
    private func stateController(){
        viewModel.state.receive(on: RunLoop.main).sink { [weak self] state in
            self?.hideSpinner()
            switch state {
            case .success:
                if self?.viewModel.searchItemList.isEmpty ?? true {
                    self?.presentAlert(message: AppLocalized.noResults, title: AppLocalized.information)
                    self?.logger.log(message: AppLocalized.noResults, type: .info)
                    return
                }
                let model = self?.viewModel.searchItemList
                self?.coordinator?.didSearchList(model: model ?? [])
                self?.logger.log(message: AppLocalized.success, type: .info)
            case .loading:
                self?.showSpinner()
            case .fail(error: let error):
                self?.presentAlert(message: error, title: AppLocalized.error)
                self?.logger.log(message: error, type: .error)
            }
        }.store(in: &cancellable)
    }
    
    override func loadView() {
        configUI()
    }
    
    private func configUI() {
        self.view = UIView()
        self.view.backgroundColor = .systemBackground
        
        navigationItem.titleView = searchBar
        searchBar.delegate = self
        searchBar.sizeToFit()
        searchBar.placeholder = AppLocalized.searchOnMercadoLibre
        searchBar.searchTextField.layer.cornerRadius = ViewValues.cornerRadiusSearchBar
        searchBar.searchTextField.layer.masksToBounds = true
    }
}

extension SearchController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text?.isEmpty ?? true {
            presentAlert(message: AppLocalized.searchBarEmpty, title: AppLocalized.information)
        }
        logger.log(message: AppLocalized.userSearchedFor + (searchBar.text ?? String()), type: .info)
        viewModel.viewDidLoad(searchUrl: searchBar.text ?? String())
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = nil
        searchBar.resignFirstResponder()
    }
}

extension SearchController: SpinnerDisplayable {}

extension SearchController: MessageDisplayable {}
