import SwiftUI

extension Control {
    struct Title: View {
        let title: LocalizedStringKey
        let background: Color
        let width: CGFloat
        let action: () -> Void
        
        var body: some View {
            Button(action: action) {
                ZStack {
                    RoundedRectangle(cornerRadius: 17)
                        .frame(width: width, height: 34)
                        .shadow(color: background, radius: 2, x: -1, y: -1)
                        .shadow(color: background, radius: 6, x: 3, y: 3)
                        .foregroundColor(background)
                    Text(title)
                        .font(Font.caption.bold())
                        .foregroundColor(.primary)
                }.frame(height: 50)
            }
        }
    }
}
