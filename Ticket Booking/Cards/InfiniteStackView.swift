//
//  InfiniteStackView.swift
//  Ticket Booking
//
//  Created by Amish Tufail on 24/01/2023.
//

import SwiftUI

struct InfintieStackView: View {
    var ticket: TicketModel
    @State var height: CGFloat = 0.0
    @Binding var tickets: [TicketModel]
    @GestureState var isDragging: Bool = false
    @State var offset: CGFloat = .zero
    var body: some View {
        VStack {
            Ticket(title: ticket.title, subtitle: ticket.subtitle, top: ticket.top, bottom: ticket.bottom, height: $height)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .zIndex(getIndex() == 0  && offset > 100 ? Double(CGFloat(tickets.count) - getIndex()) - 1.0: Double(CGFloat(tickets.count) - getIndex())) // This brings the first card on top, and if swiped then its index is reduced
        .rotationEffect(.init(degrees: getRotation(angle: 10.0))) // To create rotation effect on card while dragging
        .rotationEffect(getIndex() == 1 ? .degrees(-6.0) : .degrees(0.0)) // It rotates the 2nd card
        .rotationEffect(getIndex() == 2 ? .degrees(6.0) : .degrees(0.0)) // It rotates the 3rd card
        .scaleEffect(getIndex() == 0 ? 1.0 : 0.9) // It scales the 1st card 1.0 and remaining 0.9
        .offset(x: getIndex() == 1 ? -40.0 : 0.0) // It offsets the 2nd card
        .offset(x: getIndex() == 2 ? 40.0 : 0.0) // It offsets the 3rd card
        .offset(x: offset)
        .gesture(
            DragGesture()
                .updating($isDragging, body: { _, out, _ in
                    out = true
                })
                .onChanged({ value in
                    var transaltion = value.translation.width
                    transaltion = tickets.first?.id == ticket.id ? transaltion : 0.0
                    transaltion = isDragging ? transaltion : 0.0
                    withAnimation(.easeInOut(duration: 0.3)) {
                        offset = transaltion
                        height = -offset / 5.0
                    }
                })
                .onEnded({ value in
                    let width = UIScreen.main.bounds.width
                    let swipedRight = offset > (width / 2)  // This part is responsible for removing and adding the card if swiped right
                    let swipedLeft = -offset > (width / 2) // This part is responsible for removing the card if swiped left
                    withAnimation(.easeInOut(duration: 0.5)) {
                        if swipedLeft {
                            offset = -width
                            removeTicket()
                        } else {
                            offset = .zero
                        }
                        if swipedRight {
                            offset = width
                            removeAndAdd()
                        } else {
                            offset = .zero
                        }
                    }
                    withAnimation(.easeInOut(duration: 0.5)) {
                        offset = .zero
                        height = 0.0
                    }
                })
        )
    }
    func getIndex() -> CGFloat {
        let index = tickets.firstIndex { ticket in
            return self.ticket.id == ticket.id
        } ?? 0
        return CGFloat(index)
    }
    func getRotation(angle: Double) -> Double {
        let width = UIScreen.main.bounds.width
        let progress = offset / width
        return Double(progress * angle)
    }
    func removeAndAdd() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            var updatedTicket = ticket
            updatedTicket.id = UUID().uuidString
            tickets.append(updatedTicket)
            withAnimation(.spring()) {
                tickets.removeFirst()
            }
        }
    }
    func removeTicket() {
        withAnimation(.spring()) {
            tickets.removeFirst()
        }
    }
}
