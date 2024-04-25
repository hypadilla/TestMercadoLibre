//
//  SearchRepository.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 19/04/24.
//

protocol SearchRepository {
    func fetchSearchData(searchUrl: String) async throws -> [SearchItem]
}
