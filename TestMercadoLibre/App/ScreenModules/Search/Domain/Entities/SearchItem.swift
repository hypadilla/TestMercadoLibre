//
//  SearchItem.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 19/04/24.
//

/// Represents an item in a search result.
struct SearchItem: Decodable {
    /// The unique identifier of the item.
    let id: String
    
    /// The title of the item.
    let title: String
    
    /// The price of the item.
    let price: Double
    
    /// The URL of the thumbnail image for the item.
    let thumbnail: String
}
