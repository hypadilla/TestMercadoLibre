//
//  ProductDetailRepository.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 25/04/24.
//

/// A protocol that defines the interface for fetching product detail data.
protocol ProductDetailRepository {
    
    /// Fetches the product detail data for the given product item ID.
    /// - Parameters:
    ///   - productItemId: The ID of the product item.
    /// - Returns: The fetched `ProductDetail` object.
    /// - Throws: An error if the product detail data cannot be fetched.
    func fetchProductDetailData(productItemId: String) async throws -> ProductDetail
}
