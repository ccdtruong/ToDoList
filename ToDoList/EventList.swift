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
                    })
                }
            }
        }detail: {
            Text("detail")
        }
    }
}

#Preview {
    return EventList(data: Data())
}
