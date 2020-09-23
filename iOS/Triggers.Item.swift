import SwiftUI
import Core

extension Triggers {
    struct Item: View {
        let trigger: Smoke.Trigger
        let action: () -> Void
        
        var body: some View {
            Button(action: action) {
                ZStack {
                    GeometryReader {
                        RoundedRectangle(cornerRadius: $0.size.height / 4)
                            .shadow(color: .accentColor, radius: 2, x: -0.5, y: -0.5)
                            .shadow(color: .accentColor, radius: 2, x: 1, y: 1)
                    }
                    Text(.init(trigger.title))
                        .foregroundColor(.primary)
                        .font(Font.footnote.bold())
                        .padding()
                }
            }.accentColor(.pink)
        }
    }

}
