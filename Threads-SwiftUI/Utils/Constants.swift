//
//  Constants.swift
//  Threads-SwiftUI
//
//  Created by Gytis Ptašinskas on 2023-08-19.
//

import Firebase

struct FirestoreConstants {
    
    private static let Root = Firestore.firestore()
    
    static let userCollection = Root.collection("users")
    
    static let ThreadsCollection = Root.collection("threads")
    
    static let FollowersCollection = Root.collection("followers")
    static let FollowingCollection = Root.collection("following")
    
    static let RepliesCollection = Root.collection("replies")
    
    static let ActivityCollection = Root.collection("activity")
}
