//
//  DevUser.swift
//  Pods
//
//  Created by Erik Bean on 7/24/17.
//
//

import Foundation

/// A Base User Profile
public class DevUser: NSObject, Comparable {

    /// The current User
    static public let current = DevUser()
    private override init() {}
    /// The current user's username
    public var username: String = ""
    /// The users saved data
    public var userData: [String: Any]!
    
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
    public static func generic(username: String) -> DevUser {
        let user = DevUser()
        user.username = username
        return user
    }
    
    /// Get a generic user profile with the username "Unknown"
    public static var unknown: DevUser {
        let user = DevUser()
        user.username = "Unknown"
        return user
    }
    
    /// Add data to the users saved data
    ///
    /// - Parameters:
    ///   - key: The key the data will be saved under
    ///   - data: The data to be saved
    /// - warning: Throws an error if the key is already present
    public func addData(key: String, data: Any) throws {
        if userData.keys.contains(key) {
            throw NSError(domain: "DevUserError", code: 100, userInfo: [NSLocalizedDescriptionKey: "Cannot add user data, key already present."])
        } else {
            userData[key] = data
        }
    }
    
    /// Update an object on the users data list
    ///
    /// - Parameters:
    ///   - key: The key the data will be updated for
    ///   - data: The data to be updated
    /// - warning: Throws an error if the key is not present
    public func updateData(key: String, data: Any) throws {
        if userData.keys.contains(key) {
            userData[key] = data
        } else {
            throw NSError(domain: "DevUserError", code: 101, userInfo: [NSLocalizedDescriptionKey: "Cannot update user data, key not present."])
        }
    }
    
    /// Remove an object on the users data list
    ///
    /// - Parameters:
    ///   - key: The key the data will be removed
    /// - warning: Throws an error if the key is not present
    public func removeData(key: String) throws {
        if userData.keys.contains(key) {
            userData.removeValue(forKey: key)
        } else {
            throw NSError(domain: "DevUserError", code: 102, userInfo: [NSLocalizedDescriptionKey: "Cannot remove user data, key not present."])
        }
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
    public static func <(lhs: DevUser, rhs: DevUser) -> Bool {
        return lhs.username < rhs.username
    }
    
    /// Checks if two profiles are the same
    ///
    /// - Parameters:
    ///   - lhs: A DTUser profile to compare.
    ///   - rhs: Another DTUser profile to compare.
    public static func ==(lhs: DevUser, rhs: DevUser) -> Bool {
        return lhs.username == rhs.username
    }
}

/// Email Address preset for DevUser Userdata
public let userEmailAddress: String = "Email"
/// Authentication Token preset for DevUser Userdata
public let userToken: String = "Authentication Token"
/// First Name preset for DevUser Userdata
public let userFirstName: String = "First Name"
/// Last Name preset for DevUser Userdata
public let userLastName: String = "Last Name"
/// Full Name preset for DevUser Userdata
public let userFullName: String = "Full Name"
/// Phone Number preset for DevUser Userdata
public let userPhoneNumber: String = "Phone Number"
/// Profile Picture preset for DevUser Userdata
public let userProfilePicture: String = "Profile Picture"
/// Date of Birth preset for DevUser Userdata
public let userDateOfBirth: String = "Date of Birth"
/// Age preset for DevUser Userdata
public let userAge: String = "Age"
/// Gender preset for DevUser Userdata
public let userGender: String = "Gender"
