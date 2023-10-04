//
//  SignInViewModel.swift
//  Threads-SwiftUI
//
//  Created by Gytis Ptašinskas on 2023-08-16.
//

import Foundation

class SignInViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    @MainActor
    func signIn() async throws {
       try await AuthService.shared.signIn(withEmail: email, password: password)
    }
}
