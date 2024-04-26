//
//  AppCoordinator.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 19/04/24.
//

import UIKit

/// The coordinator responsible for managing the app's navigation flow.
final class AppCoordinator: Coordinator {
    var navigation: UINavigationController
    private let appFactory: AppFactory
    private let logger: Logger
    private var coordinator: Coordinator?
    
    /// Initializes the AppCoordinator.
    /// - Parameters:
    ///   - navigation: The navigation controller to be used for navigation.
    ///   - appFactory: The factory responsible for creating app components.
    ///   - logger: The logger to be used for logging.
    ///   - window: The app's window.
    init(navigation: UINavigationController,
         appFactory: AppFactory,
         logger: Logger,
         window: UIWindow?) {
        self.navigation = navigation
        self.appFactory = appFactory
        self.logger = logger
        configWindow(window: window)
    }
    
    /// Starts the app's navigation flow.
    func start() {
        coordinator = appFactory.makeSearchCoordinator(navigation: navigation, logger: logger)
        coordinator?.start()
    }
    
    private func configWindow(window: UIWindow?){
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }
}
