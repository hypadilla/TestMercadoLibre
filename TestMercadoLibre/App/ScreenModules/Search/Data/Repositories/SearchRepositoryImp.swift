//
//  SearchRepositoryImp.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 19/04/24.
//

import Foundation

/// Implementation of the `SearchRepository` protocol.
struct SearchRepositoryImp: SearchRepository {
    
    private let apiClientService: ApiClientService
    private let endpoint: String
    
    /// Initializes a new instance of `SearchRepositoryImp`.
    /// - Parameters:
    ///   - apiClientService: The `ApiClientService` used for making API requests.
    ///   - endpoint: The base URL endpoint for the API.
    init(apiClientService: ApiClientService, endpoint: String) {
        self.apiClientService = apiClientService
        self.endpoint = endpoint
    }
    
    /// Fetches search data from the API.
    /// - Parameters:
    ///   - searchUrl: The search URL to fetch data from.
    /// - Returns: An array of `SearchItem` objects.
    func fetchSearchData(searchUrl: String) async throws -> [SearchItem] {
        let url = URL(string: endpoint + searchUrl)
        return try await apiClientService.request(url: url, type: SearchResponseDTO.self).toDomain()
    }
}
