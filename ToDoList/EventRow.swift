//
//  EventRow.swift
//  ToDoList
//
//  Created by ccdtruong on 25/4/24.
//

import SwiftUI

struct EventRow: View {
    
    let event: Event
    var body: some View {
        HStack{
            Label{
                VStack(alignment: .leading, spacing: 5){
                    Text(event.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    Text(event.startDate.formatted())
                        .foregroundStyle(.secondary)
                }
            } icon: {
                Image(systemName: event.symbol)
                    .foregroundColor(.black)
                    .imageScale(.large)
            }
            Spacer()
        }
    }
}

#Preview {
    return EventRow(event: Event.example)
}
