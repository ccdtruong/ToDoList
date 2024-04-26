//
//  TaskRow.swift
//  ToDoList
//
//  Created by ccdtruong on 26/4/24.
//

import SwiftUI

struct TaskRow: View {
    @Binding var task:EventTask
    
    var body: some View {
        HStack{
            Button{
                task.isComplete.toggle()
            } label: {
                Image(systemName: task.isComplete ? "checkmark.circle.fill" : "circle")
            }
            .buttonStyle(.plain)
            
            TextField("To Do", text: $task.toDo)
        }
    }
}
