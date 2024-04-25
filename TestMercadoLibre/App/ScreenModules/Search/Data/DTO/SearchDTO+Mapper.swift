//
//  SearchDTO+Mapper.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 20/04/24.
//

extension SearchResponseDTO {
    func toDomain() -> [SearchItem] {
        
        return results.map { SearchItem(id: $0.id, title: $0.title, price: $0.price, thumbnail: $0.thumbnail) }
    }
}
