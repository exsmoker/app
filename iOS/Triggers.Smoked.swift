import SwiftUI
import Core

extension Triggers {
    struct Smoked: View {
        @Binding var visible: Smoke.Trigger?
        
        var body: some View {
            VStack {
                Spacer()
                    .frame(height: 60)
                Image("break")
                    .padding()
                HStack {
                    Text("We.have.you")
                        .font(.title)
                    Spacer()
                }
                HStack {
                    Text("We.are.here")
                        .foregroundColor(.secondary)
                    Spacer()
                }
                Spacer()
                Control.Title(title: "Continue", background: .accentColor, width: 190) {
                    visible = nil
                }
                Spacer()
                    .frame(height: 20)
            }.padding()
        }
    }
}
