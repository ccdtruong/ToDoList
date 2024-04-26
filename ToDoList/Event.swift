//
//  Event.swift
//  ToDoList
//
//  Created by ccdtruong on 25/4/24.
//

import Foundation

struct Event: Identifiable, Hashable, Codable{
    var id = UUID()
    var symbol: String = "plus"
    var title = ""
    var tasks = [EventTask(toDo: "")]
    var startDate = Date.now
    var endDate = Date.now
    var period: Period {
        if endDate <= Date.now{
            return .past
        }
        else if startDate <= Date.now && endDate > Date.now {
            return .doing
        }
        else {
            return .future
        }
    }
    static var example = Event(
        symbol: "case.fill",
        title: "Sayulita Trip",
        tasks: [
            EventTask(toDo: "Buy plane tickets"),
            EventTask(toDo: "Get a new bathing suit"),
            EventTask(toDo: "Find an airbnb"),
        ],
        startDate: Date(timeIntervalSinceNow: 60 * 60 * 24 * 365),
        endDate: Date(timeIntervalSinceNow: 60 * 60 * 24 * 369))
    
    static var delete = Event(symbol: "trash")
    
}
