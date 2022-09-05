//
//  StringExtensions.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 2/28/22.
//

import Foundation

public extension String {
    
    static func randon(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
}
