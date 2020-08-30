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
                Chart()
                Chart()
                Chart()
            }
        }.navigationBarTitle("Stats", displayMode: .large)
    }
}
