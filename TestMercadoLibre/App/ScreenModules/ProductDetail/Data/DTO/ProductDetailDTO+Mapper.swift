//
//  ProductDetailDTO+Mapper.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 25/04/24.
//

extension ProductDetailDTO {
    func toDomain() -> ProductDetail {
        return ProductDetail(id: id,
                             title: title,
                             price: price,
                             condition: condition,
                             pictures: pictures.map { $0.toDomain() })
    }
}
