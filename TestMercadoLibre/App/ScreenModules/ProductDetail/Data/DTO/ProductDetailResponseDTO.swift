//
//  ProductDetailResponseDTO.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 25/04/24.
//

/// Represents the response data transfer object (DTO) for product detail information.
struct ProductDetailResponseDTO: Decodable {
    /// The unique identifier of the product.
    let id: String
    
    /// The title of the product.
    let title: String
    
    /// The price of the product.
    let price: Double
    
    /// The condition of the product.
    let condition: String
    
    /// The array of picture DTOs associated with the product.
    let pictures: [PictureDTO]
}
