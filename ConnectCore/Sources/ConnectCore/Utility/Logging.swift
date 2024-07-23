//
//  Logging.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 2/28/22.
//

import Foundation
import OSLog

public enum LogLevel: Int, Comparable, CustomStringConvertible {
    case debug
    case info
    case warn
    case error

    public var description: String {
        switch self {
        case .debug:    return "DEBUG"
        case .info:     return "INFO "
        case .warn:     return "WARN "
        case .error:    return "ERROR"
        }
    }

    public static func < (lhs: LogLevel, rhs: LogLevel) -> Bool {
        lhs.rawValue < rhs.rawValue
    }

    public static func > (lhs: LogLevel, rhs: LogLevel) -> Bool {
        lhs.rawValue > rhs.rawValue
    }
}

// MARK: - LogMessage

public struct LogMessage {
    public let uuid = UUID()
    /// Time when message was logged
    public let timestamp = Date()

    /// `LogLevel` for the message.
    public let level: LogLevel

    /// the actual log message
    public let message: String

    /// File path from where the message was logged.
    public let file: StaticString

    /// File name of the log. Computed from `file`.
    public let fileName: String

    /// Line number of the log
    public let line: Int

    init(
        level: LogLevel,
        message: String,
        file: StaticString,
        line: Int
    ) {
        self.level = level
        self.message = message
        self.file = file
        self.line = line
        self.fileName = URL(fileURLWithPath: "\(file)")
            .lastPathComponent
            .components(separatedBy: ".")
            .first ?? ""
    }
}

// MARK: - OSLogger

private class OSLogger {
    private let logger: os.Logger

    init() {
        let subsystem = Bundle.main.bundleIdentifier ?? "com.nravichan.logger"
        self.logger = os.Logger(subsystem: subsystem, category: "TezConnect")
    }

    func format(logMessage: LogMessage) -> String {
        let formattedMessage = "[\(logMessage.fileName):\(logMessage.line)] \(logMessage.message)"
        return formattedMessage
    }

    func log(_ logMessage: LogMessage) {
        let message = format(logMessage: logMessage)

        switch logMessage.level {
        case .debug:
            logger.debug("\(message, privacy: .public)")
        case .info:
            logger.info("\(message, privacy: .public)")
        case .warn:
            logger.warning("\(message, privacy: .public)")
        case .error:
            logger.fault("\(message, privacy: .public)")
        }
    }
}

// MARK: - Convenience func

private let logger = OSLogger()

public func Log(_ message: String, level: LogLevel = .debug, file: StaticString = #file, line: Int = #line) {
    let logMessage = LogMessage(level: level, message: message, file: file, line: line)
    logger.log(logMessage)
}
