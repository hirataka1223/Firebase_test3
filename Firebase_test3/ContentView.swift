//
//  ContentView.swift
//  Firebase_test3
//
//  Created by Taka on 2024/03/07.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

struct ContentView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button("Sign In") {
                print("Sign In")
                Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                    guard let user = authResult?.user else {
                        return
                        if let error = error as NSError?, let errorCode = AuthErrorCode.Code(rawValue: error._code) {
                            switch errorCode {
                            case .invalidEmail:

                                ""
                            case .weakPassword:

                                ""
                            case .wrongPassword:

                                ""
                            case .userNotFound:

                                ""
                            case .networkError:

                                ""
                            default:

                                print("default")
                            }
                        }
                    }

                    print("サインイン成功")
                }

            }
        
            .padding()
            Button("Register") {
                print("Register")
                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                    guard let user = authResult?.user else {
                        return
                        
                        if let error = error as NSError?, let errorCode = AuthErrorCode.Code(rawValue: error._code) {
                            switch errorCode {
                            case .invalidEmail:
                                
                                ""
                            case .weakPassword:
                                
                                ""
                            case .emailAlreadyInUse:
                                
                                ""
                            case .networkError:
                                
                                ""
                            default:
                                
                                print("エラー")
                            }
                        }
                    }
                    
                    print("サインアップ成功")
                }
            }
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
