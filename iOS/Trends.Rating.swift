import SwiftUI
import Core

extension Trends {
    struct Rating: View {
        let index: Int
        let trend: Smoke.Trend
        
        var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(.init(.secondarySystemBackground))
                HStack {
                    Text(verbatim: "\(index + 1)")
                        .font(.footnote)
                        .foregroundColor(.accentColor)
                        .padding()
                    Text(.init(trend.trigger.title))
                        .font(.headline)
                        .padding()
                    Spacer()
                    Text(verbatim: "\(Int(trend.percent * 100))")
                        .font(Font.title.bold())
                        .foregroundColor(.accentColor)
                    Text(verbatim: "%")
                        .foregroundColor(.accentColor)
                        .font(.footnote)
                        .offset(x: -4)
                        .padding(.trailing)
                }
            }.padding(.horizontal)
        }
    }
}
