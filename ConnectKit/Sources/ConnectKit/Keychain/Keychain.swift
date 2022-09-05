//
//  Keychain.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 2/28/22.
//

import ConnectCore
import Foundation
import Security

public class Keychain {

    private let secClass = kSecClass as String
    private let secAttrAccount = kSecAttrAccount as String
    private let secValueData = kSecValueData as String
    private let secClassGenericPassword = kSecClassGenericPassword as String
    private let secAttrService = kSecAttrService as String
    private let secMatchLimit = kSecMatchLimit as String
    private let secReturnData = kSecReturnData as String
    private let secMatchLimitOne = kSecMatchLimitOne as String
    private let secAttrAccessGroup = kSecAttrAccessGroup as String
    private let setAccessControl = kSecAttrAccessControl as String
    private let secAttrAccessible = kSecAttrAccessible as String
    private let secAttrAccessibleAfterFirstUnlock = kSecAttrAccessibleAfterFirstUnlock as String

    private let service: String
    private let group: String?

    public init(service: String, group: String?) {
        self.service = service
        self.group = group
    }

    // MARK: - Accessors

    public func object<T>(forKey key: String) -> T? {
        guard let data = data(forKey: key) else { return nil }

        switch T.self {
        case is Data.Type, is Optional<Data>.Type:
            return data as? T

        case is String.Type, is Optional<String>.Type:
            return String(data: data, encoding: .utf8) as? T

        default:
            Log("Can't get type '\(type(of: T.self))' for key '\(key)'")
            return nil
        }
    }

    public func set(_ value: Any, forKey key: String) {
        if let optionalValue = value as? OptionalType {
            if let unwrappedValue = optionalValue.asOptional {
                set(unwrappedValue, forKey: key)
            } else {
                delete(key: key)
            }
            return
        }

        let data: Data

        switch value {
        case let stringValue as String:
            guard let dataValue = stringValue.data(using: .utf8) else {
                Log("Can't convert string '\(stringValue)' to data for key '\(key)'")
                return
            }
            data = dataValue

        case let dataValue as Data:
            data = dataValue

        default:
            Log("Can't set type '\(type(of: value))' for key '\(key)'")
            return
        }

        set(data, forKey: key)
    }

    // MARK: - Keychain

    public func set(_ data: Data, forKey key: String) {
        var attributes = commonQueryAttributes(key: key)
        attributes[secValueData] = data
        attributes[secAttrAccessible] = secAttrAccessibleAfterFirstUnlock

        let status = SecItemAdd(attributes as CFDictionary, nil)

        switch status {
        case noErr:
            return
        case errSecDuplicateItem:
            update(data, forKey: key)
        default:
            Log("Error adding '\(key)' to the keychain: \(status)")
        }
    }

    private func update(_ data: Data, forKey key: String) {
        let query = commonQueryAttributes(key: key)
        let updatedAttributes: [String: Any] = [
            secValueData: data,
            secAttrAccessible: secAttrAccessibleAfterFirstUnlock
        ]

        let status = SecItemUpdate(query as CFDictionary, updatedAttributes as CFDictionary)

        switch status {
        case noErr:
            return
        default:
            Log("Error updating '\(key)' to the keychain: \(status)")
        }
    }

    private func data(forKey key: String) -> Data? {
        var attributes = commonQueryAttributes(key: key)
        attributes[secMatchLimit] = secMatchLimitOne
        attributes[secReturnData] = true

        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(attributes as CFDictionary, &dataTypeRef)

        guard (status == noErr) || (status == errSecItemNotFound) else {
            Log("Failed to get value for '\(key)': \(status)")
            return nil
        }

        guard let data = dataTypeRef as? Data else { return nil }

        return data
    }

    func delete(key: String) {
        let attributes = commonQueryAttributes(key: key)

        let status = SecItemDelete(attributes as CFDictionary)

        switch status {
        case noErr, errSecItemNotFound:
            break
        default:
            Log("Failed to delete '\(key)': \(status)")
        }
    }

    public func deleteAll() {
        var attributes: [String: Any] = [
            secClass: secClassGenericPassword
        ]

        if let group = group {
            attributes[secAttrAccessGroup] = group
        }

        let status = SecItemDelete(attributes as CFDictionary)

        switch status {
        case noErr, errSecItemNotFound:
            break
        default:
            Log("Failed to delete all: \(status)")
        }
    }

    private func commonQueryAttributes(key: String) -> [String: Any] {
        var attributes: [String: Any] = [
            secClass: secClassGenericPassword,
            secAttrService: service,
            secAttrAccount: key
        ]

        if let group = group {
            attributes[secAttrAccessGroup] = group
        }

        return attributes
    }

}

@propertyWrapper
public struct KeychainItem<T> {

    let defaultValue: T
    let keychain: Keychain
    let key: String

    public init(wrappedValue: T, _ keychain: Keychain, _ key: String) {
        self.defaultValue = wrappedValue
        self.keychain = keychain
        self.key = key
    }

    public var wrappedValue: T {
        get { keychain.object(forKey: key) ?? defaultValue }
        set { keychain.set(newValue, forKey: key) }
    }

    public var projectedValue: Self {
        return self
    }

    public func delete() {
        keychain.delete(key: key)
    }

}

