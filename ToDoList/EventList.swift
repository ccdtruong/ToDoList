//
//  EventList.swift
//  ToDoList
//
//  Created by ccdtruong on 25/4/24.
//

import SwiftUI

struct EventList: View {
    @ObservedObject var data: Data
    
    @State private var selection: Event?
    
    var body: some View {
        NavigationSplitView{
            List(selection: $selection){
                ForEach(Period.allCases){ period in
                    Section(content: {
                        ForEach(data.sortEvents(period: period)){ $event in
                            EventRow(event: event)
                                .tag(event)
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
        }detail: {
            if let event = selection
            {
                EventEditor(event: data.convertToBinding(event: event))
            }
        }
    }
}

#Preview {
    return EventList(data: Data())
}
