//
//  SearchResponseDTO.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 20/04/24.
//

/// Represents the response data object for a search request.
struct SearchResponseDTO: Decodable {
    /// An array of search results.
    let results: [SearchDTO]
}
