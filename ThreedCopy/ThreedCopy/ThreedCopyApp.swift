//
//  ThreedCopyApp.swift
//  ThreedCopy
//
//  Created by Hibah Abdullah Alatawi on 11/02/1445 AH.
//

import SwiftUI

@main
struct threadsAppApp: App {
    @ObservedObject var userPreferences = UserPreferencesViewModels()
    @ObservedObject var Auth = AuthViewModel()
    @ObservedObject var userData = UserDataViewModel()
    var body: some Scene {
        WindowGroup {
     
            RootView()
                    .environmentObject(userPreferences)
                    .environmentObject(Auth)
                    .environmentObject(userData)
            
        }
    }
}
