import SwiftUI

extension Settings {
    struct Premium: View {
        var body: some View {
            HStack {
                Image(systemName: "checkmark.seal.fill")
                    .font(.largeTitle)
                Text("Premium.user")
                    .bold()
            }.foregroundColor(.accentColor)
            .padding()
        }
    }
}
