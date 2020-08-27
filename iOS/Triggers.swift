import SwiftUI
import Core

struct Triggers: View {
    let event: Event
    @Binding var visible: Event?
    @State private var triggers = [[Smoke.Trigger]]()
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ScrollView {
                    ForEach(triggers, id: \.self) { item in
                        HStack {
                            if item.count == 2 {
                                Spacer()
                            }
                            Item(trigger: item.first!)
                            Spacer()
                            if item.count == 2 {
                                Item(trigger: item.last!)
                                Spacer()
                            }
                        }.padding(.vertical, 6)
                    }
                }
            }.navigationBarTitle(.init(event.name), displayMode: .large)
            .navigationBarItems(trailing:
                                    Button(action: {
                                        visible = nil
                                    }) {
                                        Text("Cancel")
                                            .font(.caption)
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
    
    var body: some View {
        ZStack {
            GeometryReader {
                RoundedRectangle(cornerRadius: $0.size.height / 2)
                    .foregroundColor(.init(.secondarySystemBackground))
            }
            Text(.init(trigger.title))
                .foregroundColor(.primary)
                .font(.footnote)
                .padding()
        }
    }
}
