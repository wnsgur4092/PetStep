//
//  PetMessageView.swift
//  MyPetStep
//
//  Created by Shuvam Shrestha on 21/2/2023.
//

import SwiftUI

struct PetMessageView: View {
    //MARK: - PROPERTIES
    var petMessage: String
    @StateObject var messageViewModel : MessageViewModel
    
    //MARK: - BODY
    var body: some View {
        ZStack{
            VStack(spacing: 16){
                HStack(spacing: 10){
                    //Pet Image
                    ZStack{
                        Circle()
                            .fill(Color("DisplayBG"))
                            .frame(width: 28, height: 28)
                        Image("LumiDisplay")
                            .resizable()
                            .frame(width: 28, height: 28)
                            .clipShape(Circle())
                    } //: Pet Image
                    
                    //Name
                    Text("Lumi")
                        .font(.system(size: 15.0))
                        .fontWeight(Font.Weight.bold)
                        .foregroundColor(Color("MessagePetInfo"))
                    Spacer()
                } //: Name
                
                
                //Pet Message
                HStack{
                    Text(petMessage)
                        .frame(width: .infinity, height: .infinity, alignment: .leading)
                        .font(.system(size: 20))
                        .fontWeight(Font.Weight.bold)
                        .foregroundColor(Color("PrimaryColor"))
                        .lineSpacing(7)
                } //: Pet Message
                
                
                //Time
                HStack{
                    Image(systemName: "clock")
                        .resizable()
                        .frame(width: 16, height: 16)
                    Spacer().frame(width: 7)
                    Text(messageViewModel.getTime())
                        .font(.system(size: 16.0))
                        .fontWeight(Font.Weight.regular)

                    Spacer()
                } //: Time
                .foregroundColor(Color("MessageTimeStamp"))
                
            } //: VSTACK
            .padding(.vertical, 16)
            .padding(.horizontal, 22)
            
            //Background
            .background(.white)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color("MessageBorder"), lineWidth: 2)
            )
            .cornerRadius(16)
            .padding(.horizontal, 30)
        }
    }
}

//MARK: - PREVIEW
struct PetMessageView_Previews: PreviewProvider {
    static var previews: some View {
        PetMessageView(petMessage: "Hellofweffwefwewefewfwefwefwefwfwffwfwefwfw", messageViewModel: MessageViewModel())
    }
}
