import SwiftUI
import Core

extension Triggers {
    struct Reason: View {
        let reason: Core.Reason
        @Binding var display: Core.Reason?
        
        var body: some View {
            NavigationView {
                ScrollView {
                    Image(reason.image)
                        .padding()
                    HStack {
                        Text(.init(reason.category.name))
                            .font(Font.footnote.bold())
                            .padding(.leading)
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                    HStack {
                        Text(.init(reason.name))
                            .font(Font.title.bold())
                            .padding(.leading)
                            .foregroundColor(.pink)
                        Spacer()
                    }
                    HStack {
                        Text(.init(reason.description))
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.horizontal)
                        Spacer()
                    }
                }.navigationBarItems(trailing:
                                        Button(action: {
                                            display = nil
                                        }) {
                                            Text("Close")
                                                .foregroundColor(.secondary)
                                                .padding()
                                        })
            }.navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
