//
//  EventEditor.swift
//  ToDoList
//
//  Created by ccdtruong on 26/4/24.
//

import SwiftUI

struct EventEditor: View {
    @Binding var event:Event
    
    var body: some View {
        List{
            HStack{
                Image(systemName: event.symbol)
                    .imageScale(.large)
                Text(event.title)
            }
            
            Text("From: " + event.startDate.formatted())
            Text("To: " + event.endDate.formatted())
            
            
            Text("Task")
                .fontWeight(.bold)
            ForEach(event.tasks) { task in
                Text(task.toDo)
            }
        }
    }
}


