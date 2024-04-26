//
//  ProductDetailRepositoryImp.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 25/04/24.
//

import Foundation

/// A concrete implementation of the `ProductDetailRepository` protocol.
struct ProductDetailRepositoryImp: ProductDetailRepository {
    private let apiClientService: ApiClientService
    private let endpoint: String
    
    /// Initializes a new instance of `ProductDetailRepositoryImp`.
    /// - Parameters:
    ///   - apiClientService: The API client service used for making network requests.
    ///   - endpoint: The endpoint URL for fetching product detail data.
    init(apiClientService: ApiClientService, endpoint: String) {
        self.apiClientService = apiClientService
        self.endpoint = endpoint
    }
    
    /// Fetches the product detail data for the specified product item ID.
    /// - Parameters:
    ///   - productItemId: The ID of the product item.
    /// - Returns: A `ProductDetail` object representing the fetched product detail data.
    func fetchProductDetailData(productItemId: String) async throws -> ProductDetail {
        let url = URL(string:endpoint + productItemId)
        return try await apiClientService.request(url: url, type: ProductDetail.self)
    }
}
