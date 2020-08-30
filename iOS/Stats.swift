import SwiftUI

struct Stats: View {
    var body: some View {
        ScrollView {
            VStack {
                Spacer()
                    .frame(height: 10)
                HStack {
                    Text("Stats")
                        .font(Font.title.bold())
                        .foregroundColor(.secondary)
                        .padding()
                    Spacer()
                }
                Chart(values: [0.4, 0.3, 0.4, 1, 0.3])
                Chart(values: [])
                Chart(values: [])
            }
        }.navigationBarTitle("Stats", displayMode: .large)
    }
}
