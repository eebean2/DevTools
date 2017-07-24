//
//  GenUser.swift
//  Pods
//
//  Created by Erik Bean on 7/24/17.
//
//

import Foundation

/// A User Profile
public class DTUser: NSObject, Comparable {

    /// The current User
    static let current = DTUser()
    private override init() {}
    /// The current user's username
    var username: String = ""
    
    /// Set the users username
    ///
    /// - Parameters:
    ///   - username: The username of the user
    public func set(username: String) {
        self.username = username
    }
    
    /// Returns a generic user profile with the set username
    ///
    /// - Parameters:
    ///   - username: The username of the generic user
    public static func generic(username: String) -> DTUser {
        let user = DTUser()
        user.username = username
        return user
    }
    
    /// Get a generic user profile with the username "Unknown"
    public static var unknown: DTUser {
        let user = DTUser()
        user.username = "Unknown"
        return user
    }
    
    /// Returns a Boolean value indicating whether the username of the first
    /// profile is less than that of the second profile.
    ///
    /// This function is the only requirement of the `Comparable` protocol. The
    /// remainder of the relational operator functions are implemented by the
    /// standard library for any type that conforms to `Comparable`.
    ///
    /// - Parameters:
    ///   - lhs: A DTUser profile to compare.
    ///   - rhs: Another DTUser profile to compare.
    public static func <(lhs: DTUser, rhs: DTUser) -> Bool {
        return lhs.username < rhs.username
    }
    
    /// Checks if two profiles are the same
    ///
    /// - Parameters:
    ///   - lhs: A DTUser profile to compare.
    ///   - rhs: Another DTUser profile to compare.
    public static func ==(lhs: DTUser, rhs: DTUser) -> Bool {
        return lhs.username == rhs.username
    }
}
