//
//  ProfileView.swift
//  ThreedCopy
//
//  Created by Hibah Abdullah Alatawi on 11/02/1445 AH.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var  auth :AuthViewModel
    @EnvironmentObject  var userDate : UserDataViewModel

    var body: some View {
        VStack(alignment:.leading){
            //profile info section
            VStack{
                //Header
                HStack{
                    Spacer()
                    Button(action: {
                        auth.signOut()
                    }, label: {
                      Text("LogOut")
                       }
                    )
                }
                
                // user info section
                HStack{
                    VStack(alignment: .leading){
                        Text("Full name")
                            .font(.title)
                        Text("Username")
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                    AsyncImage( url:URL(string: "https://source.unsplash.com/100x100/?person")) {result in
                        if let image =
                            result.image{
                            image
                                .resizable()
                                .scaledToFill()
                        }else{
                            ProgressView()
                        }
                    }
                    .clipShape(Circle())
                    .frame(width: 75,height: 75)
                }
                //Bio
                Text("""
    Lorem ipsum dolor sit amet,
    consectetur adipiscing elit, sed do
    elusmod tempor incididunt ut labore et dolore magna aliqua.
    """)
                Text("12 follower")
                //user Actions
                HStack{
                    Button(action: {
                // showEditProfileScreenView = true
                    }, label: {
                      Text("Edit profile")
                            .frame (maxWidth: .infinity)
                            .padding(.horizontal,16)
                            .padding(.vertical,8)
                            .background (Color.black)
                            .foregroundColor (.white)
                            .cornerRadius (6.25)
                       }
                    )
                    Button(action: {
            //   showActivitySharingMethod = true
                    }, label: {
                      Text("Share profile")
                            .frame(maxWidth:.infinity)
                            .padding(.horizontal,16)
                            .padding(.vertical,8)
                            .background(RoundedRectangle(cornerRadius: 6.25).stroke(.gray.opacity(0.25))
                            )
                       }
                    )
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal)
            //Posts
            ScrollView(showsIndicators: false){
                ForEach(userDate.posts)      {  post in
                    if let user = userDate.fetchUserById(post.createdBy){
                        NavigationLink(
                            destination: {
                            PostScreenView(postModel: post,
                                           userModel: user)
                                
                        },label: { PostComponentView(postModel: post,
                                                     userModel: user)
                                
                            }
                        )
                        .buttonStyle(.plain)
                        Divider()
                    }
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
