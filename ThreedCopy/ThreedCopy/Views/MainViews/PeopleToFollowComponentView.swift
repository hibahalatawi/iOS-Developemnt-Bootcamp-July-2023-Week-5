//
//  PeopleToFollowComponentView.swift
//  ThreedCopy
//
//  Created by Hibah Abdullah Alatawi on 11/02/1445 AH.
//


import SwiftUI

struct PeopleToFollowComponentView: View {
    var body: some View {
        HStack(alignment: .top){
            AsyncImage( url:URL(string: "https://source.unsplash.com/100x100/?person")) {result in
                if let image =
                    result.image{
                    image
                        .resizable()
                        .scaledToFit()
                }else{
                    ProgressView()
                }
            }
            .frame(width: 50 ,height: 50)
            .cornerRadius(25)
            
            VStack(alignment: .leading){
                Text("Username")
                    .fontWeight(.medium)
                Text("First ,last names")
                    .foregroundColor(.gray)
                Text("21 followers")
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            Spacer()
           Button(
            action:{
                
            }, label: {
                Text("Follow")
                    .padding(.horizontal,16)
                    .padding(.vertical, 8)
                    .background(RoundedRectangle(cornerRadius: 12.5).stroke(.gray.opacity(0.25)))
            }
           )
           .buttonStyle(.plain)
        }
        .padding(.horizontal)
    }
}
