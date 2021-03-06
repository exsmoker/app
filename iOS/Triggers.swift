import SwiftUI
import Core

struct Triggers: View {
    @EnvironmentObject var session: Session
    let event: Event
    @Binding var visible: Event?
    @State private var trigger: Smoke.Trigger?
    @State private var triggers = [[Smoke.Trigger]]()
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ScrollView {
                    Text("Why")
                        .bold()
                        .foregroundColor(.secondary)
                        .padding()
                    ForEach(triggers, id: \.self) { item in
                        HStack {
                            Item(trigger: item.first!) {
                                if event == .smoked {
                                    session.smoked(.init(item.first!))
                                }
                                trigger = item.first!
                            }.padding(.leading)
                            Spacer()
                                .frame(width: 14)
                            if item.count == 2 {
                                Item(trigger: item.last!) {
                                    if event == .smoked {
                                        session.smoked(.init(item.last!))
                                    }
                                    trigger = item.last!
                                }.padding(.trailing)
                            } else {
                                Spacer()
                                    .frame(height: 20)
                            }
                        }.padding(.vertical, 6)
                    }
                }.sheet(item: $trigger, onDismiss: {
                    visible = nil
                }) { _ in
                    if event == .craving {
                        Craving(visible: $trigger)
                    } else if event == .smoked {
                        Smoked(visible: $trigger)
                    }
                }
            }.navigationBarTitle(.init(event.name), displayMode: .large)
            .navigationBarItems(trailing:
                                    Button(action: {
                                        visible = nil
                                    }) {
                                        Text("Cancel")
                                            .foregroundColor(.secondary)
                                            .padding()
                                    })
            .onAppear {
                let all = Smoke.Trigger.allCases.shuffled()
                triggers = stride(from: 0, to: all.count, by: 2).reduce(into: []) {
                    $0.append({
                        var item = [all[$0]]
                        if $0 + 1 < all.count {
                            item.append(all[$0 + 1])
                        }
                        return item
                    } ($1))
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}
