//
//  EventTask.swift
//  ToDoList
//
//  Created by ccdtruong on 25/4/24.
//

import Foundation
struct EventTask: Identifiable, Hashable, Codable{
    var id = UUID()
    var toDo = ""
    var isComplete = false
}
