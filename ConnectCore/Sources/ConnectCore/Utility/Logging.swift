//
//  Logging.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 2/28/22.
//

import Foundation
import os

public func Log(_ message: String, file: String = #file, line: Int = #line) {
    let fileName = String((file as NSString).lastPathComponent).components(separatedBy: ".").first ?? ""
//    let printableString = String(format: "[%@: %d] %@", fileName, line, message)
//    print(printableString)
    os_log(.debug, "[%@: %d] %@", fileName, line, message)
}
