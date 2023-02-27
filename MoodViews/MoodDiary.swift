//
//  MoodDiary.swift
//  MoodDiary
//
//  Created by Jitian Liang on 21/2/2023.
//

import Foundation

struct MoodDiary : Codable, Hashable {
//    var id: UUID = UUID() // needed if struct is Identifiable
    var date: String
    var value: Int
    
    // Data to be used in the preview
    static var sampleMoods: [MoodDiary] {
        return [
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
    }
    
}


