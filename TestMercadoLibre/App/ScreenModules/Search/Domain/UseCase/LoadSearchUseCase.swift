//
//  LoadSearchUseCase.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 19/04/24.
//

protocol LoadSearchUseCase {
    func execute(searchUrl: String) async throws -> Result<[SearchItem], Error>
}

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
