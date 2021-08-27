//
//  Home.swift
//  apple_signin_test (iOS)
//
//  Created by Abdullah Ridwan on 8/25/21.
//

import SwiftUI
import Firebase


struct Home: View {
    @AppStorage("log_status") var log_Status = false
    @ObservedObject var firebaseViewModel = FirebaseViewModel()

    var body: some View {
        NavigationView{
            VStack(spacing: 20){
                Text("Logged in sucessfully with apple")
                
                Button(action: {
                    print("adding the person to collection...the uid is", firebaseViewModel.user?.uid ?? "No UID")
                    firebaseViewModel.addInfo()
                }, label: {
                    Text("Add to Collection")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical, 20)
                        .frame(width: UIScreen.main.bounds.width / 2)
                        .background(Color.pink)
                        .clipShape(Capsule())
                })
                
                Button(action: {
                    //Logging Out...
                    DispatchQueue.global(qos: .background).async {
                        try? Auth.auth().signOut()
                    }
                    withAnimation(.easeInOut){
                        log_Status = false
                    }
                    
                }, label: {
                    Text("Log Out")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical, 20)
                        .frame(width: UIScreen.main.bounds.width / 2)
                        .background(Color.pink)
                        .clipShape(Capsule())
                })
            }
            .navigationTitle("Home")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
