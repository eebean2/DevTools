//
//  Doc+Helper.swift
//  DevTools
//
//  Created by Erik Bean on 7/12/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation

struct Doc {
    let title: String
    let type: String
    let message: String
    let restrictions: String?
    let warning: String?
}

struct SuperDoc {
    let holder: Any
    let title: String
    let warning: String?
}

extension SuperDoc: Comparable {
    static func <(lhs: SuperDoc, rhs: SuperDoc) -> Bool {
        return lhs.title < rhs.title
    }
    
    static func ==(lhs: SuperDoc, rhs: SuperDoc) -> Bool {
        return lhs.title == rhs.title
    }
}
