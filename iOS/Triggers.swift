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
                            Spacer()
                            Text(.init(item.first!.title))
                            Spacer()
                            if item.count == 2 {
                                Text(.init(item.last!.title))
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
                triggers = stride(from: 0, to: Smoke.Trigger.allCases.count, by: 2).reduce(into: []) {
                    $0.append({
                        var item = [Smoke.Trigger.allCases[$0]]
                        if $0 + 1 < Smoke.Trigger.allCases.count {
                            item.append(Smoke.Trigger.allCases[$0 + 1])
                        }
                        return item
                    } ($1))
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}
