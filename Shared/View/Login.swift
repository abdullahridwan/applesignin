//
//  Login.swift
//  apple_signin_test (iOS)
//
//  Created by Abdullah Ridwan on 8/25/21.
//

import SwiftUI
import AuthenticationServices

struct Login: View {
    @StateObject var loginData = LoginViewModel()
    
    var body: some View {
        ZStack{
            Image("loginScreen")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width)
                .overlay(Color.black.opacity(0.35))
                .ignoresSafeArea()
            VStack(spacing: 25){
                Text("MedMaps")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                Spacer()
                
                VStack(alignment: .leading, spacing:30, content: {
                    Text("Track Everything")
                        .font(.system(size: 45))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    Text("Track Medication Compliance quickly and easily! Add friends, family, and even your doctor!")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }).padding(.horizontal, 30)
                
                Spacer()
                
                //Login Button . . .
                SignInWithAppleButton{ (request) in
                    //requesting parameters from apple login
                    loginData.nonce = randomNonceString()
                    request.requestedScopes = [.email, .fullName]
                    request.nonce = sha256(loginData.nonce)
                } onCompletion: { (result) in
                    //getting error or success
                    switch result {
                    case .success(let user):
                        print("success")
                        guard let credential = user.credential as?  ASAuthorizationAppleIDCredential else {
                            print("Error with Firebase")
                            return
                        }
                        loginData.authenticate(credential: credential)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
                .signInWithAppleButtonStyle(.white)
                .frame(height: 55)
                .clipShape(Capsule())
                .padding(.horizontal, 40)
                .offset(y: -70)
                
                
                
            }
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
