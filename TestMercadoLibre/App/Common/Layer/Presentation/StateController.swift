//
//  State.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 19/04/24.
//

/// Represents the state of a controller.
enum StateController {
    /// The controller operation was successful.
    case success
    
    /// The controller is currently loading.
    case loading
    
    /// The controller operation failed with an error message.
    case fail(error: String)
}
