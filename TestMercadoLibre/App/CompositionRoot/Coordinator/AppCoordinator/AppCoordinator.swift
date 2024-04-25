//
//  AppCoordinator.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 19/04/24.
//

import UIKit

final class AppCoordinator: Coordinator {
    var navigation: UINavigationController
    private let appFactory: AppFactory
    private let logger: Logger
    private var coordinator: Coordinator?
    
    init(navigation: UINavigationController,
         appFactory: AppFactory,
         logger: Logger,
         window: UIWindow?) {
        self.navigation = navigation
        self.appFactory = appFactory
        self.logger = logger
        configWindow(window: window)
    }
    
    func start() {
        coordinator = appFactory.makeSearchCoordinator(navigation: navigation, logger: logger)
        coordinator?.start()
    }
    
    private func configWindow(window: UIWindow?){
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }
}
