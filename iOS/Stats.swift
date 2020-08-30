import SwiftUI

struct Stats: View {
    @State private var range = 0
    
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
                Picker("", selection: $currency) {
                    Text(verbatim: "$")
                        .bold()
                        .tag(User.Currency.dollar)
                    Text(verbatim: "€")
                        .bold()
                        .tag(User.Currency.euro)
                    Text(verbatim: "£")
                        .tag(User.Currency.pound)
                }.pickerStyle(SegmentedPickerStyle())
                    .labelsHidden()
                    .padding()
                Chart(values: [0.4, 0.3, 0.4, 1, 0.3], title: "Cigarettes", subtitle: "Over the last")
                Spacer()
                    .frame(height: 40)
                Chart(values: [], title: "", subtitle: "")
                Spacer()
                    .frame(height: 40)
                Chart(values: [], title: "", subtitle: "")
            }
        }.navigationBarTitle("Stats", displayMode: .large)
    }
}
