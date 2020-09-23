import SwiftUI

extension Settings {
    struct Free: View {
        var body: some View {
            HStack {
                Image(systemName: "seal")
                    .font(.largeTitle)
                Text("Free.user")
                    .bold()
            }.foregroundColor(.pink)
            .padding()
        }
    }
}
