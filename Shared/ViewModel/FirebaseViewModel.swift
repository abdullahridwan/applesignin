//
//  FirebaseViewModel.swift
//  apple_signin_test (iOS)
//
//  Created by Abdullah Ridwan on 8/25/21.
//

import Foundation
import Firebase
import FirebaseAuth
//import FirebaseFirestore

class FirebaseViewModel: ObservableObject {
    //private let db = FirebaseFirestore.Firestore.self
    let user = Auth.auth().currentUser
    private let db = Firestore.firestore()
    
    func addInfo(){
        if (user != nil){
            var ref: DocumentReference? = nil
            ref = db.collection(user!.uid).addDocument(data: [
                "first": "Ada",
                "last": "Lovelace",
                "born": 1815
            ]) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    print("Document added with ID: \(ref!.documentID)")
                }
            }
        }
            print("User not null")
            return
    }
}

struct User {
    var uid: String
    var email: String
}

class SessionsStore: ObservableObject {
    //@Published var f_listOfRuns: [f_Run]?
    @Published var isAnon: Bool = false
    @Published var sessionUser: User?
    
    var handle: AuthStateDidChangeListenerHandle?
    let authRef = Auth.auth()
    
    
    // Checks to see if user is logged in. If so, change Published Fields
    func listen(){
        print("[SessionStore] Listening...")
        handle = authRef.addStateDidChangeListener({ (auth, user) in
            if let user = user {
                self.isAnon = false
                self.sessionUser = User(uid: user.uid, email: user.email!)
                print("[SessionStore] User info", self.sessionUser?.uid ?? "")
            } else {
                self.isAnon = true
                self.sessionUser = nil
                print("[SessionStore] User not created...")
            }
        })
    }
    
    func unbind() {
        if let handle = handle {
            authRef.removeStateDidChangeListener(handle)
        }
    }
}



