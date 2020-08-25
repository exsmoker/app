import SwiftUI

extension Control {
    struct Circle: View {
        let image: String
        let action: () -> Void
        
        var body: some View {
            Button(action: action) {
                ZStack {
                    RoundedRectangle(cornerRadius: 28)
                        .frame(width: 56, height: 56)
                        .shadow(color: .accentColor, radius: 2, x: -1, y: -1)
                        .shadow(color: .accentColor, radius: 6, x: 3, y: 3)
                        .foregroundColor(.init(.systemBackground))
                    Image(systemName: image)
                        .font(.title)
                        .foregroundColor(.accentColor)
                }.frame(width: 70, height: 70)
            }
        }
    }
}
