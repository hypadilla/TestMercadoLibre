//
//  HttpResponseStatus.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 19/04/24.
//

/// A type that represents the status codes for HTTP responses.
enum HttpResponseStatus {
    /// The range of status codes indicating a successful response.
    static let ok = 200...299
    
    /// The range of status codes indicating a client error.
    static let clientError = 400...499
    
    /// The range of status codes indicating a server error.
    static let serverError = 500...599
}
