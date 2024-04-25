//
//  ApiClientServiceImp.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 19/04/24.
//

import Foundation

struct ApiClientServiceImp: ApiClientService {
    private let session: URLSession
    private let logger: Logger
    
    init(logger: Logger) {
        self.session = URLSession.shared
        self.logger = logger
    }
    
    func request<T: Decodable>(url: URL?, type: T.Type) async throws -> T {
        guard let url = url else {
            logger.log(message: AppLocalized.errorUrlIsNil, type: .error)
            throw ApiError.errorInUrl
        }
        logger.log(message: "\(AppLocalized.makingRequestToUrl) \(url)", type: .info)
        
        return try await makeRequest(url: url)
    }
    
    private func makeRequest<T: Decodable>(url: URL) async throws -> T {
        let request = try await session.data(from: url)
        return try validateResponse(request: request)
    }
    
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
    
    private func decodeModel<T: Decodable>(data: Data) throws -> T {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
}
