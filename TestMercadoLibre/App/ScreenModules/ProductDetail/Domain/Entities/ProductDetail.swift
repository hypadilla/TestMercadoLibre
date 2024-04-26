//
//  ProductDetail.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 25/04/24.
//

/// Represents the detailed information of a product.
struct ProductDetail: Decodable {
    /// The unique identifier of the product.
    let id: String
    /// The title or name of the product.
    let title: String
    /// The price of the product.
    let price: Double
    /// The condition of the product (e.g., new, used, refurbished).
    let condition: String
    /// The pictures associated with the product.
    let pictures: [Picture]
}
