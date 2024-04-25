//
//  LoadProductDetailUseCase.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 25/04/24.
//

protocol LoadProductDetailUseCase {
    func execute(productItemId: String) async throws -> Result<ProductDetail, Error>
}

struct LoadProductDetailUseCaseImp: LoadProductDetailUseCase {
    let repository: ProductDetailRepository
    
    func execute(productItemId: String) async throws -> Result<ProductDetail, Error> {
        do {
            let result = try await repository.fetchProductDetailData(productItemId: productItemId)
            return .success(result)
        } catch {
            return .failure(error)
        }
    }
}
