//
//  HeaderView.swift
//  ToDoList
//
//  Created by Oussama on 22/3/2024.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let backgroud: Color
    
    var body: some View {
        VStack{
            //header
            ZStack{
                RoundedRectangle(cornerRadius: 0)
                    .foregroundColor(backgroud)
                    .rotationEffect(Angle(degrees: angle))
                VStack{
                    Text(title)
                        .font(.system(size: 50))
                        .foregroundStyle(Color.white)
                        .bold()
                    Text(subtitle)
                        .font(.system(size: 30))
                        .foregroundStyle(Color.white)
                        .bold()
                }
                .padding(.top ,90)
            }
            
            .frame(width: UIScreen.main.bounds.width * 3 ,height : 300)
            
            .offset(y : -150)

          
            
            
            Spacer()
            
            
        }
    }
}

#Preview {
    HeaderView(title: "title", subtitle: "subtitle", angle: 15, backgroud: .blue)
}
