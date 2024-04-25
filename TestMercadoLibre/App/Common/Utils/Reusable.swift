//
//  Reusable.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 21/04/24.
//

protocol Reusable {
    
}

extension Reusable {
    static var reuseIdentifier: String { String(describing: self) }
}
