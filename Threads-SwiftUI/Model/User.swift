//
//  User.swift
//  Threads-SwiftUI
//
//  Created by Gytis Ptašinskas on 2023-08-16.
//

import Foundation


struct User: Identifiable, Codable, Hashable {
    let id: String
    let fullname: String
    let username: String
    let email: String
    var profileImageUrl: String?
    var bio: String?
}
