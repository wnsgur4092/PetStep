//
//  MoodCalendarView.swift
//  MoodDiary
//
//  Created by Jitian Liang on 22/2/2023.
//

import SwiftUI

struct MoodCalendarView: View {
    @EnvironmentObject var moodDiaryStorage: MoodDiaryStorage
    
    var body: some View {
        ScrollView{
            CalendarView(interval: DateInterval(start: .distantPast, end: .distantFuture), moodDiaryStorage: moodDiaryStorage)
//            Text("This is your Mood Diary!")
        }

    }
}

struct MoodCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        MoodCalendarView().environmentObject(MoodDiaryStorage(preview: true))
    }
}
