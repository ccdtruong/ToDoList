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
                    Image(systemName:event.symbol)
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
                
                Text(event.title)
            }
            
            Text("From: " + event.startDate.formatted())
            Text("To: " + event.endDate.formatted())
            
            
            Text("Task")
                .fontWeight(.bold)
            ForEach(event.tasks) { task in
                
            }
        }
    }
}


