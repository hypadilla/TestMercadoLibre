//
//  AppLogger.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 25/04/24.
//

import Foundation
import os.log


protocol Logger {
    func log(message: String, type: OSLogType)
}

class AppLogger: Logger {
    private let log: OSLog
    
    init(subsystem: String, category: String) {
        self.log = OSLog(subsystem: subsystem, category: category)
    }
    
    func log(message: String, type: OSLogType) {
        os_log("%@", log: log, type: type, message)
    }
}
