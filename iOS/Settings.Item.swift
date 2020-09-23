import SwiftUI

extension Settings {
    struct Item: View {
        let title: LocalizedStringKey
        let value: String
        let action: () -> Void
        
        var body: some View {
            Circle()
        }
    }
}
