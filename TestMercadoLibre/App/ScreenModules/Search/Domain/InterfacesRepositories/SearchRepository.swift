//
//  SearchRepository.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 19/04/24.
//

/// A protocol that defines the methods for fetching search data.
protocol SearchRepository {
    
    /// Fetches search data from the specified search URL.
    /// - Parameters:
    ///   - searchUrl: The URL string for the search.
    /// - Returns: An array of `SearchItem` objects.
    /// - Throws: An error if the search data cannot be fetched.
    func fetchSearchData(searchUrl: String) async throws -> [SearchItem]
}
