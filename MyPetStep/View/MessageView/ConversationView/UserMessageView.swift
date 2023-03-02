//
//  UserMessageView.swift
//  MyPetStep
//
//  Created by Shuvam Shrestha on 21/2/2023.
//

import SwiftUI

struct UserMessageView: View {
    //MARK: - PROPERTIES
    @StateObject var messageViewModel : MessageViewModel = MessageViewModel()
    var userMessage: String
    
    
    //MARK: - BODY
    var body: some View {
        ZStack{
            VStack(spacing: 16){
                //User Message
                HStack{
                    Text(userMessage)
                        .frame(width: 293, height: .infinity, alignment: .leading)
                        .font(.system(size: 20.0).bold())
                        .foregroundColor(Color(.white))
                } //: User Message
                
                //Time
                HStack{

                    Image(systemName: "clock")
                        .resizable()

                        .frame(width: 16, height: 16)
                    Spacer().frame(width: 7)
                    Text(messageViewModel.getTime())
                        .font(.system(size: 16.0))
                        .fontWeight(.regular)

                    Spacer()
                }
                .foregroundColor(Color("ReplyTimeStamp"))
                //: Time
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 22)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color("PrimaryColor"))
            )
            .padding(.horizontal, 30)
        } //: BODY
    }
}
//MARK: - PREVIEW
struct UserMessageView_Previews: PreviewProvider {
    static var previews: some View {
        UserMessageView(userMessage: "Hello")
    }
}
