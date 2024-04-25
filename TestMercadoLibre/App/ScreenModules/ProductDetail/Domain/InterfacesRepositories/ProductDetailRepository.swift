//
//  ProductDetailRepository.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 25/04/24.
//

protocol ProductDetailRepository {
    func fetchProductDetailData(productItemId: String) async throws -> ProductDetail
}
