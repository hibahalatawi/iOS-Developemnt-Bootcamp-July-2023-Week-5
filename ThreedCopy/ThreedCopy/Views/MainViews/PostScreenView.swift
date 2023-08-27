//
//  PostScreenView.swift
//  ThreedCopy
//
//  Created by Hibah Abdullah Alatawi on 11/02/1445 AH.
//

import SwiftUI

struct PostScreenView: View {
    @EnvironmentObject var userData : UserDataViewModel
    let postModel : PostModel
    let userModel: UserModel
    var body: some View {
        ScrollView(showsIndicators: false)
        {
            PostComponentView(
                postModel:postModel,
                userModel: userModel
            )
            Divider()
            ForEach (postModel.replies, id: \.self) { postId in
                if let post = userData.fetchPostById(postId) {
                    if let user = userData.fetchUserById(post.createdBy){
                        PostComponentView(postModel: post , userModel: user )
                    }
                  
                    Divider()
                }
            }
        }
        .navigationBarBackButtonHidden(false)
    }
}
