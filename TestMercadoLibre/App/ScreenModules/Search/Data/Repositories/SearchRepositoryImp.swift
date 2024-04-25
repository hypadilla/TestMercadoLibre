//
//  SearchRepositoryImp.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 19/04/24.
//

import Foundation

struct SearchRepositoryImp: SearchRepository {
    
    private let apiClientService: ApiClientService
    private let endpoint: String
    
    init(apiClientService: ApiClientService, endpoint: String) {
        self.apiClientService = apiClientService
        self.endpoint = endpoint
    }
    
    func fetchSearchData(searchUrl: String) async throws -> [SearchItem] {
        let url = URL(string: endpoint + searchUrl)
        return try await apiClientService.request(url: url, type: SearchResponseDTO.self).toDomain()
    }
}
