import SwiftUI
import Core

struct Triggers: View {
    let event: Event
    @Binding var visible: Event?
    @State private var trigger: Smoke.Trigger?
    @State private var triggers = [[Smoke.Trigger]]()
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ScrollView {
                    ForEach(triggers, id: \.self) { item in
                        HStack {
                            Spacer()
                            Item(trigger: item.first!) {
                                trigger = item.first!
                            }
                            Spacer()
                            if item.count == 2 {
                                Item(trigger: item.last!) {
                                    trigger = item.last!
                                }
                                Spacer()
                            } else {
                                Spacer()
                                    .frame(height: 20)
                            }
                        }.padding(.vertical, 6)
                    }
                }.sheet(item: $trigger) { _ in
                    Circle()
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

private struct Item: View {
    let trigger: Smoke.Trigger
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                GeometryReader {
                    RoundedRectangle(cornerRadius: $0.size.height / 2)
                        .foregroundColor(.accentColor)
                }
                Text(.init(trigger.title))
                    .foregroundColor(.primary)
                    .font(.footnote)
                    .padding()
            }
        }.accentColor(.purple)
    }
}
