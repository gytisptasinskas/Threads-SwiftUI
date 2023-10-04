//
//  ExploreViewModel.swift
//  Threads-SwiftUI
//
//  Created by Gytis Ptašinskas on 2023-08-16.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task { try await fetchUsers() }
    }
    
    @MainActor
    private func fetchUsers() async throws {
        self.users = try await UserService.fetchUsers()
    }
}
