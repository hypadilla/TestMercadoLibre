//
//  SearchViewModel.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 19/04/24.
//

import Combine

protocol SearchViewModel {
    var state: PassthroughSubject<StateController, Never> { get }
    var searchItemCount: Int { get }
    var searchItemList: [SearchItem] { get }
    func viewDidLoad(searchUrl: String)
}

final class SearchViewModelImp: SearchViewModel {
    var state: PassthroughSubject<StateController, Never>
    
    private let loadSearchUseCase: LoadSearchUseCase
    private var searchItems: [SearchItem] = []
    private let logger: Logger
    
    init(state: PassthroughSubject<StateController, Never>, loadSearchUseCase: LoadSearchUseCase, logger: Logger) {
        self.loadSearchUseCase = loadSearchUseCase
        self.state = state
        self.logger = logger
    }
    
    var searchItemCount: Int {
        return searchItems.count
    }
    
    var searchItemList: [SearchItem] {
        return searchItems
    }
    
    func viewDidLoad(searchUrl: String) {
        state.send(.loading)
        Task {
            do {
                let result = try await loadSearchUseCase.execute(searchUrl: searchUrl)
                switch result {
                case .success(let items):
                    logger.log(message: AppLocalized.successLoadingSearchResults, type: .info)
                    self.searchItems = items
                    state.send(.success)
                case .failure(let error):
                    let errorMessage = AppLocalized.errorLoadingSearchResults + error.localizedDescription
                    state.send(.fail(error: errorMessage))
                    logger.log(message: errorMessage, type: .error)
                }
            } catch {
                let errorMessage = AppLocalized.errorLoadingSearchResults + error.localizedDescription
                state.send(.fail(error: errorMessage))
                logger.log(message: errorMessage, type: .error)
            }
        }
    }
}
