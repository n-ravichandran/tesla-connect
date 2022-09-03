//
//  CodableExtensions.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 3/4/22.
//

import Foundation

extension Encodable {

    public var dictionary: [String: AnyObject]? {
        do {
            let encoded = try JSONEncoder().encode(self)
            let dict = try JSONSerialization.jsonObject(with: encoded, options: [])
            return dict as? [String: AnyObject]
        } catch {
            Log(error.localizedDescription)
            return nil
        }
    }

}
