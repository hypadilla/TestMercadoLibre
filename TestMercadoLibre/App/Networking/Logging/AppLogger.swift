//
//  AppLogger.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 25/04/24.
//

import Foundation
import os.log

/// A protocol for logging messages.
protocol Logger {
    /// Logs a message with the specified type.
    ///
    /// - Parameters:
    ///   - message: The message to be logged.
    ///   - type: The type of the log message.
    func log(message: String, type: OSLogType)
}

/// A logger implementation that uses the os.log API for logging.
class AppLogger: Logger {
    private let log: OSLog
    
    /// Initializes a new instance of the `AppLogger` class.
    ///
    /// - Parameters:
    ///   - subsystem: The subsystem for the log.
    ///   - category: The category for the log.
    init(subsystem: String, category: String) {
        self.log = OSLog(subsystem: subsystem, category: category)
    }
    
    func log(message: String, type: OSLogType) {
        os_log("%@", log: log, type: type, message)
    }
}
