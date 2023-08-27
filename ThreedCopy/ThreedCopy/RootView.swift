//
//  ContentView.swift
//  ThreedCopy
//
//  Created by Hibah Abdullah Alatawi on 11/02/1445 AH.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var userPreferences:UserPreferencesViewModels
    @State private var isActive = false
    var body: some View {
        VStack {
            
            Image("ss")
                .resizable()
                .frame(width: 90, height: 90)
                .padding(300)

                    Spacer()
                    Image("qq")
                        .padding(.bottom, 10)
                }
               
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                        isActive = true
                    }
                }
                .fullScreenCover(isPresented: $isActive, content: {
                    // Replace this with your main content view
                    OnboardingView()
                })
            }
        }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView().environmentObject(UserPreferencesViewModels())
    }
}
