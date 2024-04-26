//
//  EventEditor.swift
//  ToDoList
//
//  Created by ccdtruong on 26/4/24.
//

import SwiftUI

struct EventEditor: View {
    @Binding var event:Event
    @State private var isPickingSymbol = false
    @State private var symbolNames = EventSymbol.symbolNames
    var body: some View {
        List{
            HStack{
                Button(action: {
                    isPickingSymbol = true
                }, label: {
                    Image(systemName:event.symbol.isEmpty ? "Plus" : event.symbol)
                        .foregroundColor(.black)
                })
                .popover(isPresented: $isPickingSymbol, arrowEdge: .bottom){
                    VStack{
                        Text("Select a symbol")
                            .font(.headline)
                            .padding()
                        Divider()
                        let columns = Array(repeating: GridItem(.flexible()), count: 5)
                        LazyVGrid(columns: columns, spacing: 10){
                            ForEach(symbolNames, id: \.self){ symbol in
                                Button{
                                    event.symbol = symbol
                                    isPickingSymbol = false
                                } label: {
                                    Image(systemName: symbol)
                                        .imageScale(.large)
                                        .padding(5)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                    }
                }
                
                TextField("New Event", text: $event.title)
                    .font(.title2)
            }
            VStack{
                HStack{
                    Text("From: ")
                        .font(.caption)
                    DatePicker("From", selection: $event.startDate)
                        .labelsHidden()
                        .listRowSeparator(.hidden)
                }
                HStack{
                    Text("To: ")
                        .font(.caption)
                    DatePicker("To", selection: $event.endDate)
                        .labelsHidden()
                        .listRowSeparator(.hidden)
                }
            }
            
            Text("Task")
                .fontWeight(.bold)
            ForEach($event.tasks) { $task in
                TaskRow(task: $task)
            }
            //add new task
            Button{
                let newTask = EventTask(toDo: "", isComplete: false)
                event.tasks.append(newTask)
            } label: {
                Image(systemName: "plus")
            }
        }
    }
}


