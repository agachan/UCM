//
//  DateExtension.swift
//  UCM
//
//  Created by AGA TOMOHIRO on 2020/10/05.
//

import Foundation

//何時何分を文字列に相互変換
class TimeUtils {
    class func timeFromString(string: String) -> Date {
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.dateFormat = "HH:mm"
        return formatter.date(from: string) ?? formatter.date(from: "00:00")!
    }

    class func stringFromTime(date: Date) -> String {
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
}
