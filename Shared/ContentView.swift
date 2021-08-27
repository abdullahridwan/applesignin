//
//  ContentView.swift
//  Shared
//
//  Created by Abdullah Ridwan on 8/25/21.
//

/*
 To re-use
 - Change the background picture of the login screen to whatever you want
 - Delete the current "GoogleService-Info.plist" and upload your own by creating a firebase project
 **/



import SwiftUI

struct ContentView: View {
    @ObservedObject var sessionsStore = SessionsStore()
    @AppStorage("log_status") var log_Status = false
    
    init(){
        sessionsStore.listen()
    }
    
    var body: some View {
        if log_Status == false{
            Login()
        }else{
            Home()
        }
        //Login()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
