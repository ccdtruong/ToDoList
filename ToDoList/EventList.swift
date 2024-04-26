//
//  EventList.swift
//  ToDoList
//
//  Created by ccdtruong on 25/4/24.
//

import SwiftUI

struct EventList: View {
    @ObservedObject var data: EventData
    @State private var newEvent = Event()
    @State private var isAddingEvent = false
    @State private var selection: Event?
    
    
    var body: some View {
        NavigationSplitView{
            List(selection: $selection){
                ForEach(Period.allCases){ period in
                    Section(content: {
                        ForEach(data.sortEvents(period: period)){ $event in
                            EventRow(event: event)
                                .tag(event)
                                .swipeActions {
                                    Button(role: .destructive){
                                        selection = nil
                                        data.deleteEvent(event)
                                    } label: {
                                        Label("Delete", systemImage: "trash")
                                    }
                                }
                        }
                    }, header: {
                        Text(period.name)
                            .font(.callout)
                            .fontWeight(.bold)
                            .foregroundStyle(.secondary)
                    })
                    .disabled(data.sortEvents(period: period).isEmpty)
                }
            }
            .navigationTitle("Kế hoạch của ccdtruong")
            .toolbar{
                ToolbarItem{
                    Button{
                        isAddingEvent = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isAddingEvent){
                NavigationStack{
                    EventEditor(event: $newEvent)
                        .toolbar{
                            ToolbarItem(placement: .cancellationAction){
                                Button("Cancel", action: {isAddingEvent = false})
                            }
                            
                            ToolbarItem{
                                Button("Add", action: {
                                    data.addEvent(newEvent)
                                    isAddingEvent = false
                                }).disabled(newEvent.title.isEmpty)
                            }
                        }
                }
            }
        }detail: {
            if let event = selection
            {
                EventEditor(event: data.convertToBinding(event: event))
            }
        }
    }
}

#Preview {
    return EventList(data: EventData())
}
