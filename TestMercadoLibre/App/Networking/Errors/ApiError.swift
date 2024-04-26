//
//  ApiError.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 19/04/24.
//

import Foundation

/// Enum representing different API errors.
enum ApiError : Error {
    case clientError
    case serverError
    case unknownError
    case errorInUrl
    case errorDecoding
}

extension ApiError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .clientError:
            return NSLocalizedString(AppLocalized.clientError, comment: String())
        case .serverError:
            return NSLocalizedString(AppLocalized.serverError, comment: String())
        case .unknownError:
            return NSLocalizedString(AppLocalized.unknownError, comment: String())
        case .errorInUrl:
            return NSLocalizedString(AppLocalized.errorUrlIsNil, comment: String())
        case .errorDecoding:
            return NSLocalizedString(AppLocalized.errorDecoding, comment: String())
        }
    }
}
