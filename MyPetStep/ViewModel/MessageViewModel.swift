//
//  MessageViewModel.swift
//  MyPetStep
//
//  Created by JunHyuk Lim on 1/3/2023.
//

import Foundation
import SwiftUI

class MessageViewModel : ObservableObject {
    
    private var pet : Pet = Pet(name: "Lumi", petImage: "", petType: "")
    var upperResponse : String = ""
    var lowerResponse : String = ""
    
    @Published var messages: [String] = ["Hey Cindy! It's 8:00am.. Ready to go for a walk?"]
    @Published var upperResponseText: String = ""
    @Published var lowerResponseText: String = ""
    @Published var IsSent: Bool = false
    @Published var isTyping: Bool = false
    
    //MARK: - FUNCTION
    func getTime() -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        let dateString = formatter.string(from: Date())
        return dateString
    }
    
    func noResponse(message: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 30) {
            self.sendMessage(message: message)
        }
    }
    
    func moodResponse(message: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.sendMessage(message: message)
        }
    }
    
    func sendMessage(message: String) {
        IsSent.toggle()
        withAnimation {
            // 전역 변수 messages를 참조
            messages.append("[USER]" + message)
            
            withAnimation {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.isTyping.toggle()
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
                withAnimation {
                    // 전역 변수 messages를 참조
                    self.messages.append(self.getPetResponse(message: message))
                    upperResponseText = getUpperResponse(message: message)
                    lowerResponseText = getLowerResponse(message: message)
                }
                
                withAnimation {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        IsSent.toggle()
                    }
                }
            }
        }
    }

    
    func getPetResponse(message: String) -> String {
        let petMessage = message
        let responseDict = [
            "Ready as always!": "That's what I like to hear!&Before you head out.. How do you feel right now?",
            "I feel great!": "That's awesome. Let's get going then!",
            "Wait hold on..": "No pressure! Is everything alright?",
            "I need more time": "Okay! I can't send reminders right now.&But feel free to start walking anytime!",
            "Sponsor the developers": "I have sent $100 to Shuvam. Make him add this function",
            "Don't feel like walking..": "Hope this inspires you..&" + getRandomQuote(),
            "Another quote?": "Here's another one..&" + getRandomQuote(),
            "Hmm..": "I'll make a deal with you..&100 Extra Bond Points if you decide to walk",
            "unresponsive": "_&Hello? Is anyone there?",
            "Hey. Yup. Hello.": "Oh hello there! What was I saying before?",
            "Me walking?": "Oh right! I'm a dog, Cindy. I am in constant need of attention and approval.&So you ready to go for a walk?",
            "Anyone there?": "Oh hey, Cindy! It's \(getTime()), ready for your walk?",
            "Hello?": "Oh hey, Cindy! It's \(getTime()), ready for your walk?",
            "You had me at extra": "%moodtracker%"
        ]
        return responseDict[petMessage, default: "That's all I can do at the moment, Cindy!&Thank you so much for taking part in PetStep demo. Follow @PetStep on all social to stay updated!"]
    }

    //First Answer
    func getUpperResponse(message: String) -> String {
        let responseDict = [
            "Ready as always!": "%moodtracker%",
            "I feel great!": "Okay, see ya later!#LumiNeutral",
            "Wait hold on..": "I need more time#LumiHappy",
            "I need more time": "Sponsor the developers#LumiHappy",
            "Sponsor the developers": "I trust you#LumiHappy",
            "Don't feel like walking..": "Another quote?#LumiNeutral",
            "Another quote?": "Another quote?#LumiNeutral",
            "Hmm..": "You had me at extra+100#LumiHappy",
            "unresponsive": "Hey. Yup. Hello.#LumiHappy",
            "Hey. Yup. Hello.": "Me walking?#LumiNeutral",
            "Me walking?": "Ready as always!+10#LumiHappy",
            "Anyone there?": "Ready as always!+10#LumiHappy",
            "Hello?": "Ready as always!+10#LumiHappy",
            "You had me at extra": "%moodtracker%"
        ]
        return responseDict[message, default: "*"]
    }


    //SecondAnswer
    func getLowerResponse(message: String) -> String {
        let responseDict = [
            "I feel great!": "Okay, see ya later!#LumiNeutral",
            "Wait hold on..": "Don't feel like walking..#LumiHappy",
            "Sponsor the developers": "You lie#LumiSad",
            "Don't feel like walking..": "Hmm..#LumiNeutral",
            "Another quote?": "Hmm..#LumiNeutral",
            "Hmm..": "Not today, Lumi#LumiSad",
            "Hey. Yup. Hello.": "I have no idea..#LumiNeutral",
            "Me walking?": "Wait hold on..#LumiNeutral",
            "Anyone there?": "Wait hold on..#LumiNeutral",
            "Hello?": "Wait hold on..#LumiNeutral"
        ]
        return responseDict[message, default: "*"]
    }


    func getRandomQuote() -> String {
        let quotes = ["An early walk is a blessing for the whole day.",
                      "All truly great thoughts are conceived by walking.",
                      "Me thinks that the moment my legs begin to move, my thoughts begin to flow.",
                      "There are no limits. There are only plateaus, and you must not stay there, you must go beyond them.",
                      "There are plenty of difficult obstacles in your path. Don’t allow yourself to become one of them.",
                      "The secret of getting ahead is getting started.",
                      "Nothing great was ever achieved without enthusiasm.",
                      "The world wasn’t formed in a day, and neither were we. Set small goals and build upon them.",
                      "Walking is the best possible exercise. Habituate yourself to walk very far.",
                      "Walking is the favorite sport of the good and wise."]
        return quotes.randomElement()!
    }

    
    
}
