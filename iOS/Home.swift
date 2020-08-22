import SwiftUI

struct Home: View {
    var body: some View {
        ScrollView {
            Profile()
        }
    }
}

private struct Profile: View {
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.init(.secondarySystemBackground))
                    .shadow(color: .init(.tertiaryLabel), radius: 16, x: 0, y: 0)
                    .padding()
                Image(systemName: "person.fill")
                    .font(.largeTitle)
                    .foregroundColor(.accentColor)
            }.padding(.top, 50)
            Text(verbatim: "John Appleseed")
                .bold()
                .foregroundColor(.primary)
                .padding(.top)
            Text(verbatim: "Joined 14.04.20")
                .font(.footnote)
                .foregroundColor(.secondary)
        }
    }
}
