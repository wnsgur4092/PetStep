//
//  DateExtension.swift
//  MoodDiary
//
//  Created by Jitian Liang on 22/2/2023.
//

import Foundation

extension Date {
    func formattedDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
    var dateInMyFormat: String {
        formattedDate(date: Calendar.current.startOfDay(for: self))
    }
}
