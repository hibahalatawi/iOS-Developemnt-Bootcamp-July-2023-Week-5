//
//  OnboardingView.swift
//  ThreedCopy
//
//  Created by Hibah Abdullah Alatawi on 11/02/1445 AH.
//

import Foundation
import SwiftUI

struct OnboardingView: View {
    var body: some View {
            NavigationView {
                NavigationLink(destination: MainView()) {
                    VStack {
                        Image("dd")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 500, height: 730)
                            .padding(.top, -30)
                        HStack {
                            Text("Log in with instagram    ")
                                .multilineTextAlignment(.leading)
                                .padding()
                                .foregroundColor(.black)
                            Image ("aa")
                                .resizable ()
                                .scaledToFill()
                                .frame (width: 40, height: 40)

                                .padding(2)
                        }
                        .border(Color.gray, width: 2)
                        .cornerRadius(12)


                    }
                }
            }
            .navigationBarBackButtonHidden(true)

        }
    }



    struct OnboardingView_Previews: PreviewProvider {
        static var previews: some View {
            OnboardingView()
        }
    }
