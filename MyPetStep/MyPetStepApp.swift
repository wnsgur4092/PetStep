//
//  MyPetStepApp.swift
//  MyPetStep
//
//  Created by Shuvam Shrestha on 18/2/2023.
//

import SwiftUI

@main
struct MyPetStepApp: App {
    //let persistenceController = PersistenceController.shared
    @StateObject var moodDiaryStorage = MoodDiaryStorage()

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(moodDiaryStorage)
                
        }
    }
}
