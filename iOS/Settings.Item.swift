import SwiftUI

extension Settings {
    struct Item: View {
        let title: LocalizedStringKey
        let value: String
        let action: () -> Void
        
        var body: some View {
            Button(action: action) {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(.init(.secondarySystemBackground))
                    HStack {
                        Text(title)
                            .font(.headline)
                            .padding()
                        Spacer()
                        Text(verbatim: value)
                            .font(Font.title.bold())
                            .foregroundColor(.accentColor)
                            .padding()
                    }
                }.padding(.horizontal)
            }
        }
    }
}
