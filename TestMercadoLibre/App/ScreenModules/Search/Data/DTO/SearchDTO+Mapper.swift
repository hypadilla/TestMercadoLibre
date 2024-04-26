//
//  SearchDTO+Mapper.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 20/04/24.
//

/// Extension to convert `SearchResponseDTO` to an array of `SearchItem` objects.
extension SearchResponseDTO {
    
    /// Converts the `SearchResponseDTO` object to an array of `SearchItem` objects.
    /// - Returns: An array of `SearchItem` objects.
    func toDomain() -> [SearchItem] {
        return results.map { SearchItem(id: $0.id, title: $0.title, price: $0.price, thumbnail: $0.thumbnail) }
    }
}
