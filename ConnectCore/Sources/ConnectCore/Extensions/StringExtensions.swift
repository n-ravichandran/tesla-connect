//
//  StringExtensions.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 2/28/22.
//

import Foundation
import CryptoKit

public extension String {
    
    static func randon(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }

    var md5Hash: String {
        let strData = self.data(using: String.Encoding.utf8)!
        let digest = Insecure.MD5.hash(data: strData)
        return digest.map({ String(format:"%02x", $0) }).joined()
    }

}
