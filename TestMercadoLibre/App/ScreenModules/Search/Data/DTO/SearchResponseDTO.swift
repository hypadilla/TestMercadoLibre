//
//  SearchResponseDTO.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 20/04/24.
//

struct SearchResponseDTO: Decodable {
    let results: [SearchDTO]
}
