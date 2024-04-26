//
//  Endpoint.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 20/04/24.
//

/// A struct that defines the endpoints for the MercadoLibre API.
struct Endpoint {
    /// The URL for searching items on MercadoLibre.
    static let searchUrl = "https://api.mercadolibre.com/sites/MCO/search?q="
    
    /// The URL for retrieving item details on MercadoLibre.
    static let itemUrl = "https://api.mercadolibre.com/items/"
}
