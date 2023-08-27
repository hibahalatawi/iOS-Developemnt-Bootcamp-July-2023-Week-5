//
//  PostComponentView.swift
//  ThreedCopy
//
//  Created by Hibah Abdullah Alatawi on 11/02/1445 AH.
//

import SwiftUI

struct PostComponentView: View {
    @State var postModel: PostModel
    let userModel: UserModel

    var body: some View {
        ScrollView(showsIndicators: false) {
            HStack(alignment: .top){
                VStack(spacing: 4) {
                    AsyncImage(url: URL(string:"https://source.unsplash.com/60x60/?[user]"))
                    //                        resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .padding(2)

                    Spacer()
                    RoundedRectangle(cornerRadius: 1)
                        .foregroundColor(.gray)
                        .opacity(0.4)
                        .frame(maxWidth: 2, maxHeight: .infinity)
                }
                //                    .padding()
                VStack(alignment: .leading){
                    HStack{
                        Text(userModel.username)
                            .font(.headline)
                            .foregroundColor(.black)
                        Spacer()
                        Text(makePrettyDate())
                            .font(.footnote)
                            .foregroundColor(.secondary)
                        Menu {
                            Button {
                                
                            } label: {
                                Label("Report", systemImage: "exclamationmark.triangle.fill")
                            }
                            
                            Button {
                                
                            } label: {
                                Label("Block", systemImage: "circle.slash")
                            }
                            
                            Divider()
                            
                            Button {
                                
                            } label: {
                                Label("Follow", systemImage: "person.crop.circle.badge.plus")
                            }
                            
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(.black)
                        }
                        
                    }
                    
                    if let content = postModel.content {
                        Text(content)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    if postModel.attachement.count > 0 {
                        ScrollView(.horizontal,showsIndicators: false) {
                            HStack{
                                ForEach(postModel.attachement, id: \.self) { post in
                                    AsyncImage(url: post) {result in
                                        if let image =
                                            result.image{
                                            image
                                                .resizable()
                                                .scaledToFit()
                                        }else{
                                            ProgressView()
                                        }
                                    }.frame(width: 300 ,height: 200)
                                        .cornerRadius(8)
                                }

                            }
                        }
                    }

                    HStack(spacing: 15){
                        Button {
                            
                        } label: {
                            Image(systemName: "heart")
                        }
                        Button {
                            
                        } label: {
                            Image(systemName: "message")
                        }
                        Button {
                            
                        } label: {
                            Image(systemName: "arrow.2.squarepath")
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "paperplane")
                        }
                        
                        Spacer()
                    }

                    .padding(.top, 8)
                    .foregroundColor(.black)
                    
                    HStack{
                        Text(postModel.replies.count.description)
                            .foregroundColor(.gray)
                        Text(postModel.likes.description)
                            .foregroundColor(.gray)
                    } .padding(.top, 4)
                }
            }.padding(.horizontal)
            
        }
    }
    func makePrettyDate() -> String {
    
        let components = Calendar.current.dateComponents([.minute, .hour, .day], from: postModel.createdAt, to: Date())
        
        if let minuteCount = components.minute {
            if minuteCount >= 60 {
                if let hoursCount = components.hour {
                    if hoursCount >= 24 {
                        if let dayCount = components.day {
                            if dayCount >= 28 {
                                return postModel.createdAt.formatted(date: .long, time: .omitted)
                                
                            } else {
                                return" \(dayCount) d"
                            }
                        }
                        
                    } else {
                        return " \(hoursCount)h"
                    }
                    
                }
            } else {
                return "\(minuteCount) m"
            }
        }
        return postModel.createdAt
            .formatted(date: .long, time: .omitted)
    }
}
