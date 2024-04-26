//
//  ProductDetailDTO.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 25/04/24.
//

/// Represents the data transfer object (DTO) for product details.
struct ProductDetailDTO: Decodable {
    /// The unique identifier of the product.
    let id: String
    /// The title of the product.
    let title: String
    /// The price of the product.
    let price: Double
    /// The condition of the product.
    let condition: String
    /// The pictures associated with the product.
    let pictures: [PictureDTO]
}
