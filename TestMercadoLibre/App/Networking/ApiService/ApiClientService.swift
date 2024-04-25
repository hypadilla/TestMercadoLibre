//
//  ApiClientService.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 19/04/24.
//

import Foundation

protocol ApiClientService {
    func request <T: Decodable> (url: URL?, type: T.Type) async throws -> T
}
