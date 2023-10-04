//
//  SignUpViewModel.swift
//  Threads-SwiftUI
//
//  Created by Gytis Ptašinskas on 2023-08-16.
//

import Foundation

class SignUpViewModel: ObservableObject {
    @Published var email = ""
    @Published var username = ""
    @Published var fullname = ""
    @Published var password = ""
    
    @MainActor
    func createUser() async throws {
       try await AuthService.shared.createUser(withEmail: email,
                                      password: password,
                                      fullname: fullname,
                                      username: username
        )
    }
}
