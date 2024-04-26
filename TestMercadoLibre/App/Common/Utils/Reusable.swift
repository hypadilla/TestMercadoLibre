//
//  Reusable.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 21/04/24.
//

/// A protocol that defines a reusable component.
protocol Reusable {
    
}

extension Reusable {
    /// A computed property that returns the reuse identifier for the reusable component.
    static var reuseIdentifier: String { String(describing: self) }
}
