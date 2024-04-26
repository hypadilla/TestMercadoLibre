//
//  ApiClientServiceImp.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 19/04/24.
//

import Foundation

/// Implementation of the `ApiClientService` protocol.
struct ApiClientServiceImp: ApiClientService {
    private let session: URLSession
    private let logger: Logger
    
    /// Initializes an instance of `ApiClientServiceImp`.
    /// - Parameter logger: The logger to be used for logging.
    init(logger: Logger) {
        self.session = URLSession.shared
        self.logger = logger
    }
    
    /// Sends a request to the specified URL and returns the decoded response.
    /// - Parameters:
    ///   - url: The URL to send the request to.
    ///   - type: The type of the response object to decode.
    /// - Returns: The decoded response object.
    func request<T: Decodable>(url: URL?, type: T.Type) async throws -> T {
        guard let url = url else {
            logger.log(message: AppLocalized.errorUrlIsNil, type: .error)
            throw ApiError.errorInUrl
        }
        logger.log(message: "\(AppLocalized.makingRequestToUrl) \(url)", type: .info)
        
        return try await makeRequest(url: url)
    }
    
    /// Makes a request to the specified URL and returns the decoded response.
    /// - Parameter url: The URL to send the request to.
    /// - Returns: The decoded response object.
    private func makeRequest<T: Decodable>(url: URL) async throws -> T {
        let request = try await session.data(from: url)
        return try validateResponse(request: request)
    }
    
    /// Validates the response and returns the decoded response object.
    /// - Parameter request: The request tuple containing the response data and URL response.
    /// - Returns: The decoded response object.
    private func validateResponse<T: Decodable>(request: (data: Data, httpResponse: URLResponse)) throws -> T {
        guard let httpResponse = request.httpResponse as? HTTPURLResponse else {
            logger.log(message: AppLocalized.invalidHttpResponse, type: .error)
            throw ApiError.unknownError
        }
        
        switch httpResponse.statusCode {
        case HttpResponseStatus.ok:
            logger.log(message: AppLocalized.responseStatusOk, type: .info)
            return try decodeModel(data: request.data)
        case HttpResponseStatus.clientError:
            logger.log(message: "\(AppLocalized.clientError) (\(httpResponse.statusCode))", type: .error)
            throw ApiError.clientError
        case HttpResponseStatus.serverError:
            logger.log(message: "\(AppLocalized.serverError) (\(httpResponse.statusCode))", type: .error)
            throw ApiError.serverError
        default:
            logger.log(message: "\(AppLocalized.unknownError) (\(httpResponse.statusCode))", type: .error)
            throw ApiError.unknownError
        }
    }
    
    /// Decodes the response data into the specified type.
    /// - Parameter data: The response data to decode.
    /// - Returns: The decoded response object.
    private func decodeModel<T: Decodable>(data: Data) throws -> T {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
}
