//
//  AppFactory.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 19/04/24.
//

import UIKit

protocol AppFactory {
    func makeSearchCoordinator(navigation: UINavigationController, logger: Logger) -> Coordinator
}

struct AppFactoryImp: AppFactory {
    let logger: Logger
    
    init(logger: Logger) {
        self.logger = logger
    }
    
    func makeSearchCoordinator(navigation: UINavigationController, logger: Logger) -> Coordinator {
        let searchFactory = SearchFactoryImp()
        return SearchCoordinator(navigation: navigation, searchFactory: searchFactory, logger: logger)
    }
}

