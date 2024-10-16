//
//  ContentView.swift
//  MyPetStep
//
//  Created by Shuvam Shrestha on 18/2/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
  @Environment(\.managedObjectContext) private var viewContext
  
  // Variable to check the active tab. See DTB below
  @State var selection = 0
  
  // Sets the background color of the tab bar to white. See DTB below
  init() {
    UITabBar.appearance().backgroundColor = UIColor.white
  }
  
  @EnvironmentObject var moodDiaryStorage: MoodDiaryStorage
  
  var body: some View {
    
    TabView(selection: $selection) {
      MessageView().tabItem {
        if selection == 0 {
          Image(systemName: "ellipsis.message.fill")
        } else {
          Image(systemName: "ellipsis.message").environment(\.symbolVariants, .none)
        }
        Text("Messages")
        
      }.tag(0)
      
      MoodCalendarView().tabItem {
        if selection == 1 {
          Image(systemName: "book.fill")
        } else {
          Image(systemName: "book").environment(\.symbolVariants, .none)
        }
        Text("My Diary")
      }.tag(1)
      
      SettingsView().tabItem {
        if selection == 2 {
          Image(systemName: "gearshape.fill")
        } else {
          Image(systemName: "gearshape").environment(\.symbolVariants, .none)
        }
        Text("Settings")
      }.tag(2)
    }
    .accentColor(Color("AccentColor"))
    
  }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()
