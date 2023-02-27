//
//  CalendarView.swift
//  MoodDiary
//
//  Created by Jitian Liang on 22/2/2023.
//

import SwiftUI

struct CalendarView: UIViewRepresentable {
   
    let interval: DateInterval
    @ObservedObject var moodDiaryStorage: MoodDiaryStorage
    
    func makeUIView(context: Context) -> UICalendarView {
        let view = UICalendarView()
        view.delegate = context.coordinator
        view.calendar = Calendar(identifier: .gregorian)
        view.availableDateRange = interval
        return view
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self, moodDiaryStorage: _moodDiaryStorage)
    }
    
    func updateUIView(_ uiView: UICalendarView, context: Context) {
        if let changedMood = moodDiaryStorage.changedMood {
            let dateString = changedMood.date
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let date = dateFormatter.date(from: dateString)
            let dateComponents = Calendar.current.dateComponents([.year, .month, .day], from: date!)
            uiView.reloadDecorations(forDateComponents: [dateComponents], animated: true)
            moodDiaryStorage.changedMood = nil
        }
    }
    
    class Coordinator: NSObject, UICalendarViewDelegate {
        var parent: CalendarView
        @ObservedObject var moodDiaryStorage: MoodDiaryStorage
        
        init(parent: CalendarView, moodDiaryStorage: ObservedObject<MoodDiaryStorage>) {
            self.parent = parent
            self._moodDiaryStorage = moodDiaryStorage
        }
        
        @MainActor
        func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
            let foundMoods = moodDiaryStorage.moodDiary
                .filter{ $0.date == dateComponents.date?.dateInMyFormat}
            if foundMoods.isEmpty {return nil}
            
            let mood = foundMoods.first!
            
//            switch mood.value  {
//            case 1:
//                return .image(UIImage(named:"Vector-1-1"), size: .small)
//            case 2:
//                return .image(UIImage(named:"Vector-2-1"), size: .small)
//            case 3:
//                return .image(UIImage(named:"Vector-3-1"), size: .small)
//            case 4:
//                return .image(UIImage(named:"Vector-4-1"), size: .small)
//            case 5:
//                return .image(UIImage(named:"Vector-5-1"), size: .small)
//            default:
//                return .image(UIImage(named:"Vector-3-1"), size: .small)
//            }
//            return .image(UIImage(named: "Vector-\(mood.value)-1")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 5, weight: .thin)))
            return .image(UIImage(named: "Vector-\(mood.value)-2"), size: .large)
            
//            return .customView{
//                let icon = UILabel()
//                icon.text = String(mood.value)
//                return icon
//            }
        }
    }
    
}


//struct CalendarView_Previews: PreviewProvider {
//    static var previews: some View {
//        CalendarView(interval: DateInterval(start: .distantPast, end: .distantFuture), moodDiaryStorage: moodDiaryStorage)
//    }
//}
