//
//  Coordinator.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 19/04/24.
//

import UIKit

protocol Coordinator {
    var navigation: UINavigationController {get}
    func start()
}
