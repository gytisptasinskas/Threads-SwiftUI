//
//  CreateThreadViewModel.swift
//  Threads-SwiftUI
//
//  Created by Gytis Ptašinskas on 2023-08-18.
//

import Firebase

class CreateThreadViewModel: ObservableObject {
    
    func uploadThread(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let thread = Thread(ownerUid: uid,caption: caption,timestamp: Timestamp(),likes: 0)
        try await ThreadService.uploadThread(thread)
    }
}
