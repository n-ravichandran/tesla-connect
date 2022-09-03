//
//  OptionalType.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 2/28/22.
//

import Foundation

public protocol OptionalType {
    var isNil: Bool { get }
    var asOptional: Any? { get }
}

extension Optional: OptionalType {

    public var isNil: Bool {
        return self == nil
    }

    public var asOptional: Any? {
        return self
    }

}
