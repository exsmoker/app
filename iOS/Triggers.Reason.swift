import SwiftUI
import Core

extension Triggers {
    struct Reason: View {
        let reason: Core.Reason
        @Binding var display: Core.Reason?
        
        var body: some View {
            ScrollView {
                Spacer()
                    .frame(height: 30)
                HStack {
                    Text(.init(reason.title))
                        .bold()
                        .padding(.leading)
                        .foregroundColor(.secondary)
                    Spacer()
                }
                HStack {
                    Text(.init(reason.subtitle))
                        .font(Font.title.bold())
                        .padding(.leading)
                        .foregroundColor(.pink)
                    Spacer()
                }
                Image(reason.image)
                    .padding()
                HStack {
                    Text(.init(reason.description))
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                    Spacer()
                }
            }
        }
    }
}
