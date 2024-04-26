//
//  ProductDetailDTO+Mapper.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 25/04/24.
//

extension ProductDetailDTO {
    /// Converts the `ProductDetailDTO` object to a `ProductDetail` object.
    ///
    /// - Returns: A `ProductDetail` object.
    func toDomain() -> ProductDetail {
        return ProductDetail(id: id,
                             title: title,
                             price: price,
                             condition: condition,
                             pictures: pictures.map { $0.toDomain() })
    }
}
