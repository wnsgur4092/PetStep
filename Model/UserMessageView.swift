//
//  UserMessageView.swift
//  MyPetStep
//
//  Created by Shuvam Shrestha on 21/2/2023.
//

import SwiftUI

struct UserMessageView: View {
    
    var UserMessage: String
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    
    var body: some View {
        ZStack{
            VStack{
                HStack(){
                    Spacer().frame(width: 22)
                    Text(UserMessage)
                        .frame(width: 293, height: .infinity, alignment: .leading)
                        .font(.system(size: 20.0))
                        .fontWeight(Font.Weight.bold)
                        .foregroundColor(Color(.white))
                        .lineSpacing(7)
                    
                    Spacer().frame(width: 22)
                }
                Spacer().frame(height: 16)
                HStack{
                    Spacer().frame(width: 22)
                    Image(systemName: "clock")
                        .resizable()
                        .foregroundColor(Color("ReplyTimeStamp"))
                        .frame(width: 13, height: 13)
                    Spacer().frame(width: 7)
                    Text(getTime())
                        .font(.system(size: 14.0))
                        .fontWeight(Font.Weight.regular)
                        .foregroundColor(Color("ReplyTimeStamp"))
                    Spacer()
                }
            }
            
            
            .padding(.top, 17)
            .padding(.bottom, 17)
            .background(Color("PrimaryColor"))
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color("ReplyBorder"), lineWidth: 2)
            )
            
            .cornerRadius(16)
            .padding(.horizontal, 30)
            
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Image("ReplyMessageArrow")
                    Spacer().frame(width: 23)
                }
            }
        }.padding(.bottom, 15)
    }
    func getTime() -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        let dateString = formatter.string(from: Date())
        return dateString
    }
    
}




struct UserMessageView_Previews: PreviewProvider {
    static var previews: some View {
        UserMessageView(UserMessage: "Hello")
    }
}
