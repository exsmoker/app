import SwiftUI

extension Control {
    struct Circle: View {
        let image: String
        let color: Color
        let font: Font
        let action: () -> Void
        
        var body: some View {
            Button(action: action) {
                ZStack {
                    RoundedRectangle(cornerRadius: 28)
                        .frame(width: 56, height: 56)
                        .shadow(color: color, radius: 2, x: -1, y: -1)
                        .shadow(color: color, radius: 6, x: 3, y: 3)
                        .foregroundColor(.init(.systemBackground))
                    Image(systemName: image)
                        .font(font)
                        .foregroundColor(color)
                }.frame(width: 70, height: 70)
            }
        }
    }
}
