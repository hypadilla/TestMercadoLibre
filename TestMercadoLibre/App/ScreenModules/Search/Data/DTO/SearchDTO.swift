//
//  SearchDTO.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 20/04/24.
//

/// Represents the data transfer object (DTO) for a search result.
struct SearchDTO: Decodable {
    /// The unique identifier of the search result.
    let id: String
    
    /// The title of the search result.
    let title: String
    
    /// The price of the search result.
    let price: Double
    
    /// The URL of the thumbnail image for the search result.
    let thumbnail: String
}
