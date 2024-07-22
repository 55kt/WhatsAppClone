//
//  AuthProvider.swift
//  WhatsAppClone
//
//  Created by Vlad on 22/7/24.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseDatabase

enum AuthState {
    case pending, loggedIn, loggedOut
}

protocol AuthProvider {
    static var shared: AuthProvider { get }
    var authState: CurrentValueSubject<AuthState, Never> { get }
    
    func autoLogin() async
    func login(with email: String, and password: String) async throws
    func createAccount(for username: String, with email: String, and password: String) async throws
    func logOut() async
}

final class AuthManager: AuthProvider {
    
    private init() {
        
    }
    
    static let shared: any AuthProvider = AuthManager()
    
    var authState = CurrentValueSubject<AuthState, Never>(.pending)
    
    func autoLogin() async {
        // text
    }
    
    func login(with email: String, and password: String) async throws {
        // text
    }
    
    func createAccount(for username: String, with email: String, and password: String) async throws {
        // invoke firebase create account method: store the user in our firebase auth
        
        // store the new user info in database
        let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
        let uid = authResult.user.uid
        let newUser = UserItem(uid: uid, username: username, email: email)
        try await saveUserInfoDatabase(user: newUser)
    }
    
    func logOut() async {
        // text
    }
}

extension AuthManager {
    private func saveUserInfoDatabase(user: UserItem) async throws {
        let userDictionary = ["uid": user.uid, "username": user.username, "email": user.email]
        
        try await Database.database().reference().child("users").child(user.id).setValue(userDictionary)
    }
}

struct UserItem: Identifiable, Hashable, Decodable {
    let uid: String
    let username: String
    let email: String
    var bio: String? = nil
    var profileImageUrl: String? = nil
    
    var id: String {
        return uid
    }
    
    var bioUnwrapped: String {
        return bio ?? "Hey there! I am using WhatsApp."
    }
}
