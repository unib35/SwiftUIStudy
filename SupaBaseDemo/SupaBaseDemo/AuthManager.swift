//
//  AuthManager.swift
//  SupabaseDemo
//
//  Created by 이종민 on 2/3/25.
//

import Foundation
import Supabase


class AuthManager {
    
    static let shared = AuthManager()
    
    private init() {    }
    
    let client = SupabaseClient(supabaseURL: URL(string: "https://fimhtsshpzlwrajqdmjb.supabase.co")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZpbWh0c3NocHpsd3JhanFkbWpiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzg1Njc2MjIsImV4cCI6MjA1NDE0MzYyMn0.DahcSkrMJlAxM7NkPBU2uNSCgEVKvhofP79sXk0yTMw")
    
    func signInWithApple(idToken: String, nonce: String) async throws {
        let session = try await client.auth.signInWithIdToken(credentials: .init(provider: .apple, idToken: idToken, nonce: nonce))
    }

}
