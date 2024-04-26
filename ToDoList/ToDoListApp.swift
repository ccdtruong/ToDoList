//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by ccdtruong on 25/4/24.
//

import SwiftUI
import SwiftData

@main
struct ToDoListApp: App {
    @StateObject private var data = Data()
    
    var body: some Scene {
        WindowGroup {
            EventList(data: data)
        }
    }
}
