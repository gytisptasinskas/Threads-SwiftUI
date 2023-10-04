//
//  PreviewProvider.swift
//  Threads-SwiftUI
//
//  Created by Gytis Ptašinskas on 2023-08-16.
//

import SwiftUI
import Firebase

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullname: "Lewis Hamilton", username: "lewishamilton", email: "hamilton@gmail.com")
    
    let thread = Thread(ownerUid: "123", caption: "Developer thread", timestamp: Timestamp(), likes: 0)
}
