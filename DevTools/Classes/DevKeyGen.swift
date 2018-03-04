/*
 * DevKeyGen
 *
 * Created by Erik Bean on 7/25/17
 * Copyright © 2018 Erik Bean
 */

import Foundation

/// Type of key you would like
public enum KeyType {
    /// Mixed letters and numbers, both lower and uppercase
    case mixedCaseSensitive
    /// Mixed lowercase letters and numbers
    case mixedNonCaseSensitive
    /// Numbers only
    case numberOnly
    /// Letters only, both lower and uppercase
    case letterOnlyCaseSensitive
    /// lowercase letters only
    case letterOnlyNonCaseSensitive
}

private enum LettersIncluded {
    case upper
    case lower
    case number
}

/// Random Key Generator
public class DevKeyGen {
    private let uppers = [
        "A", "B", "C", "D", "E", "F", "G", "H", "I", "J",
        "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T",
        "U", "V", "W", "X", "Y", "Z"
    ]
    private let lowers = [
        "a", "b", "c", "d", "e", "f", "g", "h", "i", "j",
        "k", "l", "m", "n", "o", "p", "q", "r", "s", "t",
        "u", "v", "w", "x", "y", "z"
    ]
    private let numbers = [
        "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"
    ]
    private var included: [LettersIncluded] = [.upper, .lower, .number]
    private var type: KeyType!
    
    /// Initilize a KeyGen object with Key Type, default is .mixedCaseSensitive
    public init(_ type: KeyType = .mixedCaseSensitive) {
        self.type = type
    }
    
    /// Returns a key with set length
    public func get(_ length: Int) -> String {
        var pool = Array<String>()
        var code = String()
        switch type! {
        case .mixedCaseSensitive:
            if included.contains(.upper) {
                pool.append(contentsOf: uppers)
            }
            if included.contains(.lower) {
                pool.append(contentsOf: lowers)
            }
            if included.contains(.number) {
                pool.append(contentsOf: numbers)
            }
            for _ in 1...length {
                let rand = arc4random_uniform(UInt32(pool.count - 1))
                code.append(pool[Int(rand)])
            }
            return code
        case .mixedNonCaseSensitive:
            if included.contains(.lower) {
                pool.append(contentsOf: lowers)
            }
            if included.contains(.number) {
                pool.append(contentsOf: numbers)
            }
            for _ in 1...length {
                let rand = arc4random_uniform(UInt32(pool.count - 1))
                code.append(pool[Int(rand)])
            }
            return code
        case .numberOnly:
            if included.contains(.number) {
                pool.append(contentsOf: numbers)
            }
            for _ in 1...length {
                let rand = arc4random_uniform(UInt32(pool.count - 1))
                code.append(pool[Int(rand)])
            }
            return code
        case .letterOnlyCaseSensitive:
            if included.contains(.lower) {
                pool.append(contentsOf: lowers)
            }
            if included.contains(.upper) {
                pool.append(contentsOf: uppers)
            }
            for _ in 1...length {
                let rand = arc4random_uniform(UInt32(pool.count - 1))
                code.append(pool[Int(rand)])
            }
            return code
        case .letterOnlyNonCaseSensitive:
            pool.append(contentsOf: lowers)
            for _ in 1...length {
                let rand = arc4random_uniform(UInt32(pool.count - 1))
                code.append(pool[Int(rand)])
            }
            return code
        }
    }
    
    /// Returns a key 16 characters long
    public func get16() -> String {
        return get(16)
    }
    
    /// Returns a key 32 characters long
    public func get32() -> String {
        return get(32)
    }
}
