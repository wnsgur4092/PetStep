//
//  OnBoardingPetMessageView.swift
//  MyPetStep
//
//  Created by Shuvam Shrestha on 22/2/2023.
//

import SwiftUI

struct OnBoardingPetMessageView: View {
    var PetMessage: String
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Spacer().frame(width: 22)
                    ZStack{
                        Circle()
                            .fill(Color("DisplayBG"))
                            .frame(width: 28, height: 28)
                        Image("LumiDisplay")
                            .resizable()
                            .frame(width: 28, height: 28)
                            .clipShape(Circle())
                        
                    }
                    
                    Spacer().frame(width: 10)
                    Text("Lumi")
                        .font(.system(size: 15.0))
                        .fontWeight(Font.Weight.bold)
                        .foregroundColor(Color("MessagePetInfo"))
                    Spacer()
                }
                Spacer().frame(height: 10)
                HStack(){
                    Spacer().frame(width: 22)
                    Text(PetMessage)
                        .frame(width: 293, height: .infinity, alignment: .leading)
                        .font(.system(size: 20))
                        .fontWeight(Font.Weight.bold)
                        .foregroundColor(Color("PrimaryColor"))
                        .lineSpacing(7)
                    
                    Spacer().frame(width: 22)
                }
                Spacer().frame(height: 16)
                HStack{
                    Spacer().frame(width: 22)
                    Image(systemName: "clock")
                        .resizable()
                        .foregroundColor(Color("MessageTimeStamp"))
                        .frame(width: 13, height: 13)
                    Spacer().frame(width: 7)
                    Text(getTime())
                        .font(.system(size: 14.0))
                        .fontWeight(Font.Weight.regular)
                        .foregroundColor(Color("MessageTimeStamp"))
                    Spacer()
                }
            }
            
            
            .padding(.top, 17)
            .padding(.bottom, 17)
            .background(.white)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color("MessageBorder"), lineWidth: 2)
            )
            
            .cornerRadius(16)
            .padding(.horizontal, 30)
            
            VStack{
                Spacer()
                HStack{
                    Spacer().frame(width: 24)
                    Image("MainMessageArrow")
                    Spacer()
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



struct OnBoardingPetMessageView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingPetMessageView(PetMessage: "Hello")
    }
}



