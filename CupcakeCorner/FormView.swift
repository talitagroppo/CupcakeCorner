//
//  FormView.swift
//  CupcakeCorner
//
//  Created by Talita Groppo on 28/02/2021.
//

//import SwiftUI
//
//struct FormView: View {
//    @State private var username = ""
//        @State private var email = ""
//    var disableForm: Bool {
//        username.count < 5 || email.count < 5
//    }
//    var body: some View {
//        Form {
//                    Section {
//                        TextField("Username", text: $username)
//                        TextField("Email", text: $email)
//                    }
//
//                    Section {
//                        Button("Create account") {
//                            print("Creating account…")
//                        }
//                    }
//                    .disabled(disableForm)
//
//                }
//            }
//        }
//
//struct FormView_Previews: PreviewProvider {
//    static var previews: some View {
//        FormView()
//    }
//}
