//
//  LoadSearchUseCase.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 19/04/24.
//

/// A protocol that defines the use case for loading search data.
protocol LoadSearchUseCase {
    
    /// Executes the search use case with the given search URL.
    /// - Parameters:
    ///   - searchUrl: The URL string for the search.
    /// - Returns: A `Result` object containing an array of `SearchItem` on success, or an `Error` on failure.
    func execute(searchUrl: String) async throws -> Result<[SearchItem], Error>
}

/// A concrete implementation of the `LoadSearchUseCase` protocol.
struct LoadSearchUseCaseImp: LoadSearchUseCase {
    let repository: SearchRepository
    
    func execute(searchUrl: String) async throws -> Result<[SearchItem], Error> {
        do {
            let result = try await repository.fetchSearchData(searchUrl: searchUrl)
            return .success(result)
        } catch {
            return .failure(error)
        }
    }
}
