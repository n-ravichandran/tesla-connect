//
//  BundleExtensions.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 9/3/22.
//

import Foundation

public extension Bundle {

    var appIdPrefix: String {
        infoDictionary!["AppIdentifierPrefix"] as! String
    }

    var keychainService: String { "TeslaConnect" }

    var keychainGroup: String { "\(appIdPrefix)com.nravichan.tesla.connect" }
}
