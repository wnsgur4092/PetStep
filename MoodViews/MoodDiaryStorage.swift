//
//  MoodDiaryStorage.swift
//  MoodDiary
//
//  Created by Jitian Liang on 21/2/2023.
//

import Foundation

// the class act as wrapper function of Storage functions
@MainActor
class MoodDiaryStorage: ObservableObject {
    // data is stored in this array
    @Published var moodDiary = [MoodDiary]()
    // used to update calendar view
    @Published var changedMood: MoodDiary?
    // used to set ChooseMoodView
    @Published var currentMood: MoodDiary?
    @Published var preview: Bool
    
    
    // fetch data from "somewhere" when this class is instantiated
    init(preview: Bool = false) {
        self.preview = preview
        seed()
        fetch()
    }
    
    // save the array to JSON file
    func persist(_ items : [MoodDiary]) {
        Storage.store(items, to: .documents, as: "diary_list.json")
    }
    
    // read the "diary_list.json file from somewhere inside the app
    // Note: don't worry if you cannot find the file in left hand side (main bundle)
    //       use fetch and dispaly (already done in content view) to check and test
    //       it is not saved in main bundle but somewhere else.
    //       the files in main bundle is read only
    func fetch() {
        if preview {
            moodDiary = MoodDiary.sampleMoods
        } else {
            let list = Storage.retrive("diary_list.json", from: .documents, as: [MoodDiary].self) ?? []
            moodDiary = list
        }
        
    }
    
    // Append the new mood to the moodDiary array
    func addMood(value: Int) {
        let mood = MoodDiary(date: formattedDate(), value: value)
        // overwrite same date entry
        if (mood.date == moodDiary.last?.date) {
            moodDiary.removeLast()
        }
        moodDiary.append(mood)
        persist(moodDiary)
        changedMood = mood
        currentMood = mood
    }
    
    // format date as string
    private func formattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: Date())
    }
    
    // remove diary_list.json in the "somewhere" directory
    func clearHistory(){
        Storage.remove("diary_list.json", from: .documents)
        moodDiary = []
    }
    
    // seed random data
    func seed() {
        moodDiary = [
                MoodDiary(date: "2023-02-01", value: 1),
                MoodDiary(date: "2023-02-02", value: 2),
                MoodDiary(date: "2023-02-03", value: 3),
                MoodDiary(date: "2023-02-04", value: 4),
                MoodDiary(date: "2023-02-05", value: 4),
                MoodDiary(date: "2023-02-06", value: 1),
                MoodDiary(date: "2023-02-07", value: 1),
                MoodDiary(date: "2023-02-08", value: 2),
                MoodDiary(date: "2023-02-09", value: 3),
                MoodDiary(date: "2023-02-11", value: 5),
                MoodDiary(date: "2023-02-13", value: 5),
                MoodDiary(date: "2023-02-14", value: 4),
                MoodDiary(date: "2023-02-15", value: 5),
                MoodDiary(date: "2023-02-16", value: 3),
                MoodDiary(date: "2023-02-17", value: 4),
                MoodDiary(date: "2023-02-20", value: 4),
                MoodDiary(date: "2023-02-21", value: 5),
                MoodDiary(date: "2023-02-22", value: 3),
            ]
        persist(moodDiary)
    }
}
