//
//  HttpResponseStatus.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 19/04/24.
//

enum HttpResponseStatus {
    static let ok = 200...299
    static let clientError = 400...499
    static let serverError = 500...599
}
