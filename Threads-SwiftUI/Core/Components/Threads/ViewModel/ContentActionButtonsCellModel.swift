//
//  ContentActionButtonsCellModel.swift
//  Threads-SwiftUI
//
//  Created by Gytis Ptašinskas on 2023-08-19.
//

import Foundation


@MainActor
class ContentActionButtonsCellModel: ObservableObject {
    @Published var thread: Thread
    
    init(thread: Thread) {
        self.thread = thread
        Task { try await checkIfUserLikedThread() }
    }
    
    func likeThread() async throws {
        try await ThreadService.likeThread(thread)
        self.thread.didLike = true
        self.thread.likes += 1
    }
    
    func unlikeThread() async throws {
        try await ThreadService.unlikeThread(thread)
        self.thread.didLike = false
        self.thread.likes -= 1
    }
    
    func checkIfUserLikedThread() async throws {
        let didLike = try await ThreadService.checkifUserLikedThread(thread)
        
        if didLike {
            self.thread.didLike = true
        }
    }
}
