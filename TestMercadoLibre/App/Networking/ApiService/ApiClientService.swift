//
//  ApiClientService.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 19/04/24.
//

import Foundation

/// A protocol defining the API client service.
protocol ApiClientService {
    
    /// Sends a request to the specified URL and decodes the response into the specified type.
    /// - Parameters:
    ///   - url: The URL to send the request to.
    ///   - type: The type to decode the response into.
    /// - Returns: The decoded response of the specified type.
    func request<T: Decodable>(url: URL?, type: T.Type) async throws -> T
}
