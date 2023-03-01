//
//  ConversationDatabase.swift
//  MyPetStep
//
//  Created by Shuvam Shrestha on 19/2/2023.
//

import Foundation

func getPetResponse(message: String) -> String {
    
    let petMessage = message
    
    switch petMessage {
        
    case "Ready as always!":
        return "That's what I like to hear!&Before you head out.. How do you feel right now?"
        
    case "I feel great!":
        return "That's awesome. Let's get going then!"
        
    case "Wait hold on..":
        return "No pressure! Is everything alright?"
        
    case "I need more time":
        return "Okay! I can't send reminders right now.&But feel free to start walking anytime!"
        
    case "Sponsor the developers":
        return "I have sent $100 to Shuvam. Make him add this function"
        
    case "Don't feel like walking..":
        return "Hope this inspires you..&"+getRandomQuote()
        
    case "Another quote?":
        return "Here's another one..&"+getRandomQuote()
    
    case "Hmm..":
        return "I'll make a deal with you..&100 Extra Bond Points if you decide to walk"
        
    case "unresponsive":
        return "_&Hello? Is anyone there?"
        
    case "Hey. Yup. Hello.":
        return "Oh hello there! What was I saying before?"
        
    case "Me walking?":
        return "Oh right! I'm a dog, Cindy. I am in constant need of attention and approval.&So you ready to go for a walk?"
    
    case "Anyone there?":
        return "Oh hey, Cindy! It's \(getTime()), ready for your walk?"
        
    case "Hello?":
        return "Oh hey, Cindy! It's \(getTime()), ready for your walk?"
        
    case "You had me at extra":
        return "That's what I like to hear!&Before you head out.. How do you feel right now?"
        
    default:
        return "That's all I can do at the moment, Cindy!&Thank you so much for taking part in PetStep demo. Follow @PetStep on all social to stay updated!"
        //    case "Yes":
        //        return "Nice! Before you head out, how do you feel right now?"
        //
        //    case "No":
        //        return "Why not?"
        //
        //    case "Don't feel like walking":
        //        return "Extra 500 bonds if you do!"
        //
        //    case "Still no":
        //        return "A wise man once said I need to take a shit"
        //
        //    case "You had me at extra":
        //        return "Now that's what I like to hear!"
        //
        //    default:
        //        return "Umm okay. But you wanna walk tho?"
        //    }
    }
}

func getUpperResponse(message: String) -> String {
    
    let primaryMessage = message
    
    switch primaryMessage {
        
    case "Ready as always!":
        return "%moodtracker%"
        
    case "I feel great!":
        return "Okay, see ya later!#LumiNeutral"
        
    case "Wait hold on..":
        return "I need more time#LumiHappy"
    
    case "I need more time":
        return "Sponsor the developers#LumiHappy"
        
    case "Sponsor the developers":
        return "I trust you#LumiHappy"
        
    case "Don't feel like walking..":
        return "Another quote?#LumiNeutral"
    
    case "Another quote?":
        return "Another quote?#LumiNeutral"
        
    case "Hmm..":
        return "You had me at extra+100#LumiHappy"
        
    case "unresponsive":
        return "Hey. Yup. Hello.#LumiHappy"
        
    case "Hey. Yup. Hello.":
        return "Me walking?#LumiNeutral"
        
    case "Me walking?":
        return "Ready as always!+10#LumiHappy"
        
    case "Anyone there?":
        return "Ready as always!+10#LumiHappy"
        
    case "Hello?":
        return "Ready as always!+10#LumiHappy"
        
    case "You had me at extra":
        return "%moodtracker%"
        
    default:
        return "*"
        //    case "Yes":
        //        return "I feel great!#LumiHappy"
        //
        //    case "No":
        //        return "Don't feel like walking#LumiSad"
        //
        //    case "Don't feel like walking":
        //        return "You had me at extra+500#LumiHappy"
        //
        //    case "Still no":
        //        return "Good for him#LumiNeutral"
        //
        //    default:
        //        return "*"
        //    }
    }
    
}

func getLowerResponse(message: String) -> String {
    
    let secondaryMessage = message
    
    switch secondaryMessage {
        
    case "I feel great!":
        return "Okay, see ya later!#LumiNeutral"
        
    case "Wait hold on..":
        return "Don't feel like walking..#LumiHappy"
        
    case "Sponsor the developers":
        return "You lie#LumiSad"
        
    case "Don't feel like walking..":
        return "Hmm..#LumiNeutral"
        
    case "Another quote?":
        return "Hmm..#LumiNeutral"
        
    case "Hmm..":
        return "Not today, Lumi#LumiSad"
    
    case "I need more time":
        return "*"
    
    case "Hey. Yup. Hello.":
        return "I have no idea..#LumiNeutral"
    
    case "Me walking?":
        return "Wait hold on..#LumiNeutral"
        
    case "Anyone there?":
        return "Wait hold on..#LumiNeutral"
        
    case "Hello?":
        return "Wait hold on..#LumiNeutral"
        
        
    default:
        return "*"
        //    // Negative Messages
        //
        //    case "No":
        //        return "Remind me later#LumiHappy"
        //
        //    case "Don't feel like walking":
        //        return "Still a no..#LumiSad"
        //
        //    case "Still no":
        //        return "Okay I'm ready#LumiHappy"
        //
        //    default:
        //        return "*"
        //    }
        
    }
    

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

func getTime() -> String {
    let formatter = DateFormatter()
    formatter.timeStyle = .short
    let dateString = formatter.string(from: Date())
    return dateString
}
