//
//  SignInView.swift
//  SupabaseDemo
//
//  Created by 이종민 on 2/3/25.
//

import SwiftUI

class SignInVIewModel: ObservableObject {
    
    func signInWithApple() {
        
    }
    
    
}


struct SignInView: View {
    @StateObject var viewModel = SignInVIewModel()
    let signInApple = SignInApple()
    
    var body: some View {
        Button {
            print(#fileID, #function, #line, " - apple login button")
            signInApple.startSignInWithAppleFlow { result in
                switch result {
                case .success(let appleResult):
                    print(appleResult)
                case .failure(_ ):
                    print("error")
                }
            }
        } label: {
            Text("Sign in with Apple")
                .foregroundStyle(.black)
        }

    }
}

#Preview {
    SignInView()
}
