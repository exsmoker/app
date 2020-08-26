import SwiftUI

struct Triggers: View {
    let event: Event
    @Binding var visible: Event?
    
    var body: some View {
        NavigationView {
            List {
                Section(header:
                            Text("What.triggered")
                            .foregroundColor(.secondary)) {
                    Circle()
                }
            }.listStyle(GroupedListStyle())
            .navigationBarTitle(.init(event.name), displayMode: .large)
            .navigationBarItems(trailing:
                                    Button(action: {
                                        visible = nil
                                    }) {
                                        Text("Cancel")
                                            .font(.caption)
                                            .foregroundColor(.secondary)
                                            .padding()
                                    })
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}
