//
//  ProductDetailRepositoryImp.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 25/04/24.
//

import Foundation

struct ProductDetailRepositoryImp: ProductDetailRepository {
    private let apiClientService: ApiClientService
    private let endpoint: String
    
    init(apiClientService: ApiClientService, endpoint: String) {
        self.apiClientService = apiClientService
        self.endpoint = endpoint
    }
    
    func fetchProductDetailData(productItemId: String) async throws -> ProductDetail {
        let url = URL(string:endpoint + productItemId)
        return try await apiClientService.request(url: url, type: ProductDetail.self)
    }
}
