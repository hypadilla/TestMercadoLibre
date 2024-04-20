//
//  AppCoordinator.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 19/04/24.
//

import UIKit

final class AppCoordinator: Coordinator{
    var navigation: UINavigationController
    private let appFactory: AppFactory
    
    init(navigation: UINavigationController, 
         appFactory: AppFactory,
         window: UIWindow?) {
        self.navigation = navigation
        self.appFactory = appFactory
        configWindow(window: window)
    }
    
    func start() {
        let coordinator = appFactory.makeSearchCoordinator(navigation: navigation)
        coordinator.start()
    }
    
    private func configWindow(window: UIWindow?){
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }
    
}
