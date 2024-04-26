//
//  Data.swift
//  ToDoList
//
//  Created by ccdtruong on 25/4/24.
//

import Foundation
import SwiftUI
//define symbol struct
struct EventSymbol{
    static var symbolNames = [
                "house.fill",
                "ticket.fill",
                "gamecontroller.fill",
                "theatermasks.fill",
                "ladybug.fill",
                "books.vertical.fill",
                "moon.zzz.fill",
                "umbrella.fill",
                "paintbrush.pointed.fill",
                "leaf.fill",
                "globe.americas.fill",
                "clock.fill",
                "building.2.fill",
                "gift.fill",
                "graduationcap.fill",
                "heart.rectangle.fill",
                "phone.bubble.left.fill",
                "cloud.rain.fill",
                "building.columns.fill",
                "mic.circle.fill",
                "comb.fill",
                "person.3.fill",
                "bell.fill",
                "hammer.fill",
                "star.fill",
                "crown.fill",
                "briefcase.fill",
                "speaker.wave.3.fill",
                "tshirt.fill",
                "tag.fill",
                "airplane",
                "pawprint.fill",
                "case.fill",
                "creditcard.fill",
                "infinity.circle.fill",
                "dice.fill",
                "heart.fill",
                "camera.fill",
                "bicycle",
                "radio.fill",
                "car.fill",
                "flag.fill",
                "map.fill",
                "figure.wave",
                "mappin.and.ellipse",
                "heart.text.square.fill",
                "eyeglasses",
                "tram.fill",
    ]
}

//define enum Period

enum Period: String, CaseIterable, Identifiable{
    case past = "Past"
    case doing = "Doing"
    case future = "Future"
    
    var id:String{self.rawValue}
    var name:String{self.rawValue}
}

class Data: ObservableObject {
    @Published var events: [Event] = [
            Event(symbol: "gift.fill",
                  title: "Maya's Birthday",
                  tasks: [EventTask(toDo: "Guava kombucha"),
                          EventTask(toDo: "Paper cups and plates"),
                          EventTask(toDo: "Cheese plate"),
                          EventTask(toDo: "Party poppers"),
                         ],
                  startDate: Date(timeIntervalSinceNow: 60 * 60 * 24 * 30),
                  endDate:  Date(timeIntervalSinceNow:  60 * 60 * 24 * 31)),
            
            Event(symbol: "theatermasks.fill",
                  title: "Pagliacci",
                  tasks: [EventTask(toDo: "Buy new tux"),
                          EventTask(toDo: "Get tickets"),
                          EventTask(toDo: "Book a flight for Carmen"),
                         ],
                  startDate: Date(timeIntervalSinceNow: 60 * 60 * 22),
                  endDate: Date(timeIntervalSinceNow: 60 * 60 * 25)),
            
            Event(symbol: "heart.square.fill",
                  title: "Health Check-up",
                  tasks: [EventTask(toDo: "Bring medical ID"),
                          EventTask(toDo: "Record heart rate data"),
                         ],
                  startDate: Date(timeIntervalSinceNow: 60 * 60 * 24 * 4),
                  endDate: Date(timeIntervalSinceNow: 60 * 60 * (24 * 4 + 5))),
            
            Event(symbol: "leaf.fill",
                  title: "Camping Trip",
                  tasks: [EventTask(toDo: "Find a sleeping bag"),
                          EventTask(toDo: "Bug spray"),
                          EventTask(toDo: "Paper towels"),
                          EventTask(toDo: "Food for 4 meals"),
                          EventTask(toDo: "Straw hat"),
                         ],
                  startDate: Date(timeIntervalSinceNow: 60 * 60 * 36),
                  endDate: Date(timeIntervalSinceNow: 60 * 60 * 46)),
            
            Event(symbol: "gamecontroller.fill",
                  title: "Game Night",
                  tasks: [EventTask(toDo: "Find a board game to bring"),
                          EventTask(toDo: "Bring a dessert to share"),
                         ],
                  startDate: Date(timeIntervalSinceNow: 60 * 60 * 24 * 2),
                  endDate: Date(timeIntervalSinceNow: 60 * 60 * (24 * 2 + 4))),
            
            Event(symbol: "graduationcap.fill",
                  title: "First Day of School",
                  tasks: [
                      EventTask(toDo: "Notebooks"),
                      EventTask(toDo: "Pencils"),
                      EventTask(toDo: "Binder"),
                      EventTask(toDo: "First day of school outfit"),
                  ],
                  startDate: Date(timeIntervalSinceNow: 60 * 60 * 24 * 365),
                  endDate: Date(timeIntervalSinceNow: 60 * 60 * 366)),
            
            Event(symbol: "book.fill",
                  title: "Book Launch",
                  tasks: [
                      EventTask(toDo: "Finish first draft"),
                      EventTask(toDo: "Send draft to editor"),
                      EventTask(toDo: "Final read-through"),
                  ],
                  startDate: Date(timeIntervalSinceNow: 60 * 60 * 24 * 365 * 2),
                  endDate: Date(timeIntervalSinceNow: 60 * 60 * 365 * 2.5)),
            
            Event(symbol: "case.fill",
                  title: "Sayulita Trip",
                  tasks: [
                      EventTask(toDo: "Buy plane tickets"),
                      EventTask(toDo: "Get a new bathing suit"),
                      EventTask(toDo: "Find a hotel room"),
                  ],
                  startDate: Date(timeIntervalSinceNow: 60 * 60 * 24 * 10),
                  endDate: Date(timeIntervalSinceNow: 60 * 60 * 24 * 17)),
        ]
    
    func sortEvents(period: Period) -> Binding<[Event]> {
            Binding<[Event]>(
                get: {
                    self.events
                        .filter { $0.period == period}
                        .sorted { $0.startDate < $1.startDate }
                },
                set: { events in
                    for event in events {
                        if let index = self.events.firstIndex(where: { $0.id == event.id }) {
                            self.events[index] = event
                        }
                    }
                }
            )
        }
    //convert Event to Binding<Event>
    func convertToBinding(event: Event) ->Binding<Event>{
        Binding<Event>(
            get: {
                guard let index = self.events.firstIndex(where: {$0.id == event.id}) else{
                    return Event()
                }
                return self.events[index]
            },
            set: { event in
                guard let index = self.events.firstIndex(where: {$0.id == event.id}) else {
                    return
                }
                self.events[index] = event
                
            }
        )
    }
}
