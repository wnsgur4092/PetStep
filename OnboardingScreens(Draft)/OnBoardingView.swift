//
//  OnBoardingView.swift
//  MyPetStep
//
//  Created by Shuvam Shrestha on 22/2/2023.
//

import SwiftUI
import AVKit

struct OnBoardingView: View {
    var body: some View {
        OnboardConversation()
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}

struct OnboardConversation: View {
    var body: some View {
        VStack{
            ScrollView{
                OnBoardingPetMessageView(PetMessage: "This is a long ass filler message to takeup space up there. Can you see that space up there? Yeah, that's because of this long ass message. I think that's enough space now. Bye. Love you.").opacity(0)
                OnBoardingPetMessageView(PetMessage: "Hello")
                OnBoardingPetFollowView(PetMessage: "Hello")
            }
        }.edgesIgnoringSafeArea(.all)
    }
}
