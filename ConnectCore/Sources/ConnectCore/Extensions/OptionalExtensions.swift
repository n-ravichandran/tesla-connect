//
//  OptionalExtensions.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 2/28/22.
//

import Foundation

public extension Optional where Wrapped == Bool {
    
    var isTrue: Bool {
        self ?? false
    }
    
}
