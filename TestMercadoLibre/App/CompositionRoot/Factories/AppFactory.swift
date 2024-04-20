//
//  AppFactory.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 19/04/24.
//

import UIKit

protocol AppFactory {
    func makeSearchCoordinator(navigation: UINavigationController) -> Coordinator
}

struct AppFactoryImp: AppFactory {
    func makeSearchCoordinator(navigation: UINavigationController) -> Coordinator{
//        let coordinator = SearchCoordinator(navigation: navigation)
//        coordinator.start()
        return FakeCoordinator(navigation: navigation)
    }
}

final class FakeCoordinator: Coordinator {
    var navigation: UINavigationController
    
    init(navigation: UINavigationController){
        self.navigation = navigation
    }
    
    func start() {
        
    }
}
