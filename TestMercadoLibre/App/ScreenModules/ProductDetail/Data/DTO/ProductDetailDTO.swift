//
//  ProductDetailDTO.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 25/04/24.
//

struct ProductDetailDTO: Decodable {
    let id: String
    let title: String
    let price: Double
    let condition: String
    let pictures: [PictureDTO]
}
